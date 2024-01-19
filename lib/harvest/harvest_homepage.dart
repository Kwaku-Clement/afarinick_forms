import 'dart:async';

import 'package:afarinick_forms/harvest/sync_harvest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import '../constants/synchronization.dart';
import '../constants/widgets.dart';
import 'harvest_bloc.dart';
import 'harvest_detailpage.dart';
import 'harvesting_form.dart';

class HarvestingHomePage extends StatefulWidget {
  const HarvestingHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HarvestingHomePageState createState() => _HarvestingHomePageState();
}

class _HarvestingHomePageState extends State<HarvestingHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late AnimationController _animationController;
  final SlidableController _slidableController = SlidableController();
  final ScrollController _scrollController = ScrollController();
  bool isFAB = false;
  late Timer _timer;


  Future syncToDatabase() async{
    await SyncHarvest().fetchAllInfo().then((nurseryList) async{
      EasyLoading.show(status: 'Don\t close app. Uploading data...');
      await SyncHarvest().saveToMysqlWith(nurseryList);
      EasyLoading.showSuccess('Saved successfully');
    });
  }

  Future isInternet() async{
    await Synchronization.isInternet().then((connection) {
      if(connection) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Internet available')));

      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No internet')));
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
        elevation: 2,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (c) => const HarvestingForm()));
        },
        label: const Text('Add'),
        icon:  const Icon(
            Icons.add,
            color: Colors.red,
          ),
      ),
      drawer: buildDrawer(context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appbar(scaffoldKey: _scaffoldKey,
              onPressed: () async{
                await Synchronization.isInternet().then((connection) {
                  if(connection){
                    syncToDatabase();
                  }
                  else {
                  }
                });
              },),
            BlocBuilder<HarvestBloc, HarvestState>(builder: (context, state) {
              if (state is HarvestInitial) {
                context.read<HarvestBloc>().add(const FetchHarvests());
              }
              if (state is DisplayHarvests) {
                return state.harvest.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 5, bottom: 5),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.harvest.length,
                          controller: _scrollController,
                          itemBuilder: (context, i) {
                            return GestureDetector(
                              onTap: () {
                                context.read<HarvestBloc>().add(
                                    FetchSpecificHarvest(
                                        id: state.harvest[i].id!));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        const HarvestDetailPage()),
                                  ),
                                );
                              },
                              child: Slidable(
                                key: UniqueKey(),
                                controller: _slidableController,
                                direction: Axis.horizontal,
                                dismissal: SlidableDismissal(
                                  child: const SlidableDrawerDismissal(),
                                  onDismissed: (actionType) {
                                    context.read<HarvestBloc>().add(
                                        DeleteHarvest(
                                            id: state.harvest[i].id!));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      duration:
                                      Duration(milliseconds: 1000),
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
                                      context.read<HarvestBloc>().add(
                                          DeleteHarvest(
                                              id: state.harvest[i].id!));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration:
                                            Duration(milliseconds: 1000),
                                        content: Text("Deleted"),
                                      ));
                                    },
                                  ),
                                ],
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () {
                                      context.read<HarvestBloc>().add(
                                          DeleteHarvest(
                                              id: state.harvest[i].id!));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration:
                                            Duration(milliseconds: 1000),
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
                                      context.read<HarvestBloc>().add(
                                          FetchSpecificHarvest(
                                              id: state.harvest[i].id!));
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) =>
                                              const HarvestDetailPage()),
                                        ),
                                      );
                                    },
                                    title: Text(
                                      state.harvest[i].soil_sawdust,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      overflow: TextOverflow.ellipsis,
                                      state.harvest[i].sand_sawdust,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(
                                    overflow: TextOverflow.ellipsis,
                                    DateFormat.yMMMEd().format(state.harvest[i].createdTime),
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                    isThreeLine: true,
                                  ),
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

