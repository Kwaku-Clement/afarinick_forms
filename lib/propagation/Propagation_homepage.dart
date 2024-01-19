import 'dart:async';

import 'package:afarinick_forms/constants/synchronization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import '../constants/widgets.dart';
import 'propagation_bloc.dart';
import 'propagation_detailpage.dart';
import 'propagation_form.dart';
import 'sync_propagation.dart';

class PropagationHomepage extends StatefulWidget {
  const PropagationHomepage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PropagationHomepageState createState() => _PropagationHomepageState();
}

class _PropagationHomepageState extends State<PropagationHomepage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  final SlidableController _slidableController = SlidableController();
  final ScrollController _scrollController = ScrollController();
  bool isFAB = false;

  late Timer _timer;

  Future syncToDatabase() async {
    await SyncPropagation().fetchAllInfo().then((userList) async {
      EasyLoading.show(status: 'Don\'t close app. uploading data...');
      await SyncPropagation().saveToMysqlWith(userList);
      EasyLoading.showSuccess('Successfully save to mysql');
    });
  }

  Future isInternet() async {
    await Synchronization.isInternet().then((connection) {
      if (connection) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Internet available")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("No Internet")));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isInternet();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);

    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          isFAB = true;
        });
      } else {
        setState(() {
          isFAB = false;
        });
      }
    });

    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (c) => const PropagationForm()));
        },
      ),
      drawer: buildDrawer(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appbar(
              scaffoldKey: _scaffoldKey,
              onPressed: () async {
                await SyncPropagation.isInternet().then((connection) {
                  if (connection) {
                    syncToDatabase();
                  } else {}
                });
              },
            ),
            BlocBuilder<PropagationBloc, PropagationState>(
                builder: (context, state) {
              if (state is PropagationInitial) {
                context.read<PropagationBloc>().add(const FetchPropagation());
              }
              if (state is DisplayPropagation) {
                return state.propagation.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 5, bottom: 5),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.propagation.length,
                          controller: _scrollController,
                          itemBuilder: (context, i) {
                            return Slidable(
                              key: UniqueKey(),
                              controller: _slidableController,
                              direction: Axis.horizontal,
                              dismissal: SlidableDismissal(
                                child: const SlidableDrawerDismissal(),
                                onDismissed: (actionType) {
                                  context.read<PropagationBloc>().add(
                                      DeletePropagation(
                                          id: state.propagation[i].id!));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(milliseconds: 1000),
                                    content: Text("Deleted"),
                                  ));
                                },
                              ),
                              actionPane: const SlidableScrollActionPane(),
                              actionExtentRatio: 0.20,
                              actions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () {
                                    context.read<PropagationBloc>().add(
                                        DeletePropagation(
                                            id: state.propagation[i].id!));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      content: Text("Deleted"),
                                    ));
                                  },
                                ),
                              ],
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.archive,
                                  onTap: () {
                                    context.read<PropagationBloc>().add(
                                        DeletePropagation(
                                            id: state.propagation[i].id!));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration: Duration(milliseconds: 1000),
                                      content: Text("Deleted"),
                                    ));
                                  },
                                ),
                              ],
                              child: Card(
                                elevation: 1,
                                color: Colors.white,
                                child: ListTile(
                                  onTap: () {
                                    context.read<PropagationBloc>().add(
                                        FetchSpecificPropagation(
                                            id: state.propagation[i].id!));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const PropagationDetailPage()),
                                      ),
                                    );
                                  },
                                  title: Text(
                                    state.propagation[i].source_location,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    overflow: TextOverflow.ellipsis,
                                    state.propagation[i].truck_number,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    overflow: TextOverflow.ellipsis,
                                    DateFormat.yMMMEd().format(
                                        state.propagation[i].createdTime),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  isThreeLine: true,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(child: Text('No data added'));
              }
              return const Center(child: CircularProgressIndicator());
            }),
          ],
        ),
      ),
    );
  }
}
