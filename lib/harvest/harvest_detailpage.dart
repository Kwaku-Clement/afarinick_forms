import 'package:afarinick_forms/harvest/harvest_homepage.dart';
import 'package:back_pressed/back_pressed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/BottomSheet.dart';
import '../constants/constants.dart';
import 'harvest_bloc.dart';
import 'harvest_model.dart';

class HarvestDetailPage extends StatefulWidget {
  const HarvestDetailPage({super.key});

  @override
  _HarvestDetailPageState createState() => _HarvestDetailPageState();
}

class _HarvestDetailPageState extends State<HarvestDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnBackPressed(
      perform: () {
        context.read<HarvestBloc>().add(const FetchHarvests());
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              context.read<HarvestBloc>().add(const FetchHarvests());
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: BlocBuilder<HarvestBloc, HarvestState>(builder: (context, state) {
          if (state is DisplaySpecificHarvest) {
            Harvest currentHarvest = state.harvest;

            return Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 8,
                bottom: 20,
              ),
              child: ListView(
                children: [   const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Harvesting",
                        style: kTextStyle,
                      ),
                    )),
                  const SizedBox(height: 10,),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        "Growing Media Preparation",
                        style: kTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentHarvest.soil_sawdust,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Quantity of Soil and Sawdust'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentHarvest.sand_sawdust,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Quantity of Sand and Sawdust'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentHarvest.comment,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Other Comment'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentHarvest.nursery_bags_requested,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText:
                              'Quantity of Nursery Bags Requested and Received'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentHarvest.nursery_bags_filled,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Quantity of Nursery Bags Filled'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,

                      initialValue: currentHarvest.clusters_arranged,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Quantity of Clusters Arranged'),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        "Harvesting",
                        style: kTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,

                      initialValue: currentHarvest.box_code,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Box Code'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,

                      initialValue: currentHarvest.harvested,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Quantity Harvested'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,

                      initialValue: currentHarvest.loss_quantity,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Loss Quantity'),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        "Transplanting",
                        style: kTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,

                      initialValue: currentHarvest.transplanted_cluster_code,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Transplanted Cluster Code'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentHarvest.seedlings_cluster,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Quantity of Seedlings per Cluster'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            );
          }
          return Container();
        }),

        bottomSheet: ElevatedButton(
          child: const Text('Edit', style: kSendButtonTextStyle,),
          onPressed: () {
            showModalBottomSheet(
                isDismissible: false,
                useSafeArea: true,
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.white,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: BlocBuilder<HarvestBloc, HarvestState>(
                        builder: (context, state) {
                      if (state is DisplaySpecificHarvest) {
                        Harvest currentHarvest = state.harvest;
                        return BottomSheetWidget(
                            container: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [       const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Harvesting Update-Form",
                                            style: kTextStyle,
                                          ),
                                        )),
                                      const Divider(height: 1, color: Colors.black),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _soilSawdust,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide quantity of soil and sawdust';
                                            }
                                          },
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity of Soil and Sawdust'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _sandSawdust,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide quantity of sand and sawdust';
                                            }
                                          },
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity of Sand and Sawdust'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _other,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, Other Comment';
                                            }
                                          },
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText: 'Other Comment'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _nBagsRequested,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide of nursery bags requested and received';
                                            }
                                          },
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity of Nursery Bags Requested and Received'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _nBagsFilled,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide of quantity of Nursery Bags Filled';
                                            }
                                          },
                                          //initialValue: currentHarvest.nursery_bags_filled,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity of Nursery Bags Filled'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _clustersArranged,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide of quantity of Clusters Arranged';
                                            }
                                          },
                                          //initialValue: currentHarvest.clusters_arranged,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity of Clusters Arranged'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.0, bottom: 10),
                                          child: Text(
                                            "Harvesting",
                                            style: kTextStyle,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _boxCode,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide the Box code';
                                            }
                                          },
                                          //initialValue: currentHarvest.box_code,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(labelText: 'Box Code'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _quantityHarvested,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide the quantity harvested';
                                            }
                                          },
                                          //initialValue: currentHarvest.harvested,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity Harvested'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _lossQuantity,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide the quantity lost';
                                            }
                                          },
                                          //initialValue: currentHarvest.loss_quantity,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText: 'Loss Quantity'),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 20.0, bottom: 10),
                                          child: Text(
                                            "Transplanting",
                                            style: kTextStyle,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _clusterCode,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide transplanted cluster code';
                                            }
                                          },
                                          //initialValue: currentHarvest.transplanted_cluster_code,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Transplanted Cluster Code'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8),
                                        child: TextFormField(
                                          controller: _seedlingsPerCluster,
                                          validator: (value) {
                                            if (value!.isNotEmpty) {
                                              return null;
                                            } else {
                                              return 'Please, provide quantity of seedlings per cluster';
                                            }
                                          },
                                          //initialValue: currentHarvest.seedlings_cluster,
                                          decoration: kInputTextFieldDecoration
                                              .copyWith(
                                                  labelText:
                                                      'Quantity of Seedlings per Cluster'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTapConfirm: () async {
                              try {
                                if (_formKey.currentState!.validate()) {
                                  context.read<HarvestBloc>().add(
                                        UpdateHarvest(
                                          harvest: Harvest(
                                            id: currentHarvest.id,
                                            comment: _other.text,
                                            nursery_bags_requested:
                                                _nBagsRequested.text,
                                            transplanted_cluster_code:
                                                _clusterCode.text,
                                            seedlings_cluster:
                                                _seedlingsPerCluster.text,
                                            nursery_bags_filled:
                                                _nBagsFilled.text,
                                            clusters_arranged:
                                                _clustersArranged.text,
                                            box_code: _boxCode.text,
                                            harvested: _quantityHarvested.text,
                                            loss_quantity: _lossQuantity.text,
                                            soil_sawdust: _soilSawdust.text,
                                            sand_sawdust: _sandSawdust.text,
                                            createdTime: DateTime.now(),
                                          ),
                                        ),
                                      );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("harvest Updated successfully"),
                                  ));
                                  context
                                      .read<HarvestBloc>()
                                      .add(const FetchHarvests());
                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => const HarvestingHomePage()));                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    e.toString(),
                                  ),
                                ));
                              }
                            },
                            onTapClose: () {
                              Navigator.pop(context);
                            });
                      }
                      return Container();
                    }),
                  );
                });
          },
        ),
      ),
    );
  }
}

final TextEditingController _soilSawdust = TextEditingController();
final TextEditingController _sandSawdust = TextEditingController();
final TextEditingController _other = TextEditingController();
final TextEditingController _nBagsRequested = TextEditingController();
final TextEditingController _nBagsFilled = TextEditingController();
final TextEditingController _clustersArranged = TextEditingController();
final TextEditingController _boxCode = TextEditingController();
final TextEditingController _quantityHarvested = TextEditingController();
final TextEditingController _lossQuantity = TextEditingController();
final TextEditingController _clusterCode = TextEditingController();
final TextEditingController _seedlingsPerCluster = TextEditingController();
