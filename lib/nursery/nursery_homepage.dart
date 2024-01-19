import 'dart:async';

import 'package:afarinick_forms/nursery/nursery_bloc.dart';
import 'package:afarinick_forms/nursery/nursery_detailpage.dart';
import 'package:afarinick_forms/nursery/nursery_form.dart';
import 'package:afarinick_forms/nursery/sync_nursery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../constants/synchronization.dart';
import '../constants/widgets.dart';

class NurseryHomePage extends StatefulWidget {
  const NurseryHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NurseryHomePageState createState() => _NurseryHomePageState();
}

class _NurseryHomePageState extends State<NurseryHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  final SlidableController _slidableController = SlidableController();
  final ScrollController _scrollController = ScrollController();
  bool isFAB = false;

  late Timer _timer;
  bool loading = true;

  Future syncToDatabase() async {
    await SyncNursery().fetchAllInfo().then((nurseryList) async {
      EasyLoading.show(status: 'Don\t close app. Uploading data...');
      await SyncNursery().saveToMysqlWith(nurseryList);
      EasyLoading.showSuccess('Saved successfully');
    });
  }

  Future isInternet() async {
    await Synchronization.isInternet().then((connection) {
      if (connection) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Internet available')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('No internet')));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    isInternet();

    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer.cancel();
      }
    });

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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        icon: const Icon(
          Icons.add,
          color: Colors.red,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const NurseryForm()));
        },
        label: const Text('Add'),
      ),
      drawer: buildDrawer(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appbar(
              scaffoldKey: _scaffoldKey,
              onPressed: () async {
                await Synchronization.isInternet().then((connection) {
                  if (connection) {
                    syncToDatabase();
                  } else {}
                });
              },
            ),
            BlocBuilder<NurseryBloc, NurseryState>(builder: (context, state) {
              if (state is NurseryInitial) {
                context.read<NurseryBloc>().add(const FetchNursery());
              }
              if (state is DisplayNursery) {
                return state.nursery.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 5, bottom: 5),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.nursery.length,
                          controller: _scrollController,
                          itemBuilder: (context, i) {
                            return Slidable(
                              key: UniqueKey(),
                              controller: _slidableController,
                              direction: Axis.horizontal,
                              dismissal: SlidableDismissal(
                                child: const SlidableDrawerDismissal(),
                                onDismissed: (actionType) {
                                  context.read<NurseryBloc>().add(
                                      DeleteNursery(id: state.nursery[i].id!));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(milliseconds: 1000),
                                        content: Text("Deleted")),
                                  );
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
                                    context.read<NurseryBloc>().add(
                                        DeleteNursery(
                                            id: state.nursery[i].id!));
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
                                    context.read<NurseryBloc>().add(
                                        DeleteNursery(
                                            id: state.nursery[i].id!));
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
                                    context.read<NurseryBloc>().add(
                                        FetchSpecificNursery(
                                            id: state.nursery[i].id!));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: ((context) =>
                                            const NurseryDetailPage()),
                                      ),
                                    );
                                  },
                                  title: Text(
                                    state.nursery[i].staff_contact,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  trailing: Text(
                                    overflow: TextOverflow.ellipsis,
                                    DateFormat.yMMMEd()
                                        .format(state.nursery[i].createdTime),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    overflow: TextOverflow.ellipsis,
                                    state.nursery[i].nursery_name,
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
