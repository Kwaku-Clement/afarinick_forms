import 'package:back_pressed/back_pressed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../constants/BottomSheet.dart';
import 'nursery_bloc.dart';
import 'nursery_homepage.dart';
import 'nursery_model.dart';

class NurseryDetailPage extends StatefulWidget {
  const NurseryDetailPage({super.key});

  @override
  _NurseryDetailPageState createState() => _NurseryDetailPageState();
}

class _NurseryDetailPageState extends State<NurseryDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool read = false;
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
        context.read<NurseryBloc>().add(const FetchNursery());
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              context.read<NurseryBloc>().add(const FetchNursery());
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: BlocBuilder<NurseryBloc, NurseryState>(builder: (context, state) {
          if (state is DisplaySpecificNursery) {
            Nursery currentNursery = state.nursery;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Nursery Activities",
                      style: kTextStyle,
                    ),
                  )),
                  const Divider(height: 1, color: Colors.black),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      initialValue: currentNursery.date_capturing,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Date of capturing'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.staff_contact,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Staff Contact'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.staff_contact,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Staff Contact'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      initialValue: currentNursery.nursery_name,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Farm Name'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.sector_name,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Sector Name'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.segment,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Segment'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.cluster_id,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Cluster ID'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      initialValue: currentNursery.decapitation,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was Decapitation done?'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.decapitation_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Decapitation)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      initialValue: currentNursery.watering,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was watering done? '),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.watering_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Watering)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.mulching,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was mulching done? '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.mulching_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Mulching)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.rearrangement,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was Rearrangement done? '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.rearrangement_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Rearrangement)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.fertilisation,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was Fertilisation done? '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.fertilisation_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Fertilisation)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.insecticide,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was Insecticide applied? '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.insecticide_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Insecticide)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly:true,
                      initialValue: currentNursery.seedlings,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was splitting of multiple seedlings done? '),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.seedlings_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText:
                              'Comments (Splitting of multiple seedlings)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.leafcutting,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was leaf cutting done? '),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.leafcutting_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (leaf cutting)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.weeding,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Was weeding control done? '),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.weeding_comments,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Weeding control)'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      readOnly: true,
                      initialValue: currentNursery.observation,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Comments (Additional observation)'),
                    ),
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
                    child: BlocBuilder<NurseryBloc, NurseryState>(
                        builder: (context, state) {
                          if (state is DisplaySpecificNursery) {
                            Nursery currentNursery = state.nursery;
                            return BottomSheetWidget(
                                container: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                        key: _formKey,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            children: [
                                              const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "Nursery Update Form",
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
                                                  controller: _dateController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide date of capturing';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Date of capturing'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _staffcontactController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide staff contact';
                                                    }
                                                  },
                                                  //initialValue: currentHarvest.transplanted_cluster_code,
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Staff contact'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _staffnameController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide staff name';
                                                    }
                                                  },
                                                  //initialValue: currentHarvest.transplanted_cluster_code,
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Staff name'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Name of the nursery:",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: farm.map(
                                                                (value) {
                                                              final selected = selectedFarm == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedFarm,
                                                                onChanged: (value) =>
                                                                    setState(() => selectedFarm = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _sectornameController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide sector name';
                                                    }
                                                  },
                                                  //initialValue: currentHarvest.transplanted_cluster_code,
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Sector name'),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _segmentController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide segment';
                                                    }
                                                  },
                                                  //initialValue: currentHarvest.transplanted_cluster_code,
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Segment'),
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _clusterIDController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide cluster ID';
                                                    }
                                                  },
                                                  //initialValue: currentHarvest.transplanted_cluster_code,
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Cluster ID'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Was Decapitation done?",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: decapitation.map(
                                                                (value) {
                                                              final selected =
                                                                  selectedDecapitation == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedDecapitation,
                                                                onChanged: (value) => setState(
                                                                        () => selectedDecapitation = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _decapitationController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide decapitation comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Decapitation)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Was Watering done?",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: watering.map(
                                                                (value) {
                                                              final selected = selectedWatering == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedWatering,
                                                                onChanged: (value) => setState(
                                                                        () => selectedWatering = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _wateringController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide watering comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Watering)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Mulching",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: mulching.map(
                                                                (value) {
                                                              final selected = selectedMulching == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedMulching,
                                                                onChanged: (value) => setState(
                                                                        () => selectedMulching = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _mulchingController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide mulching comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Mulching)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Re-arrangement",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: rearrangement.map(
                                                                (value) {
                                                              final selected =
                                                                  selectedRearrangement == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedRearrangement,
                                                                onChanged: (value) => setState(
                                                                        () => selectedRearrangement = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _rearrangementController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide Rearrangement comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Rearrangement)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Fertilisation",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: fertigation.map(
                                                                (value) {
                                                              final selected =
                                                                  selectedFertilisation == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedFertilisation,
                                                                onChanged: (value) => setState(
                                                                        () => selectedFertilisation = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _fertilisationController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide fertilisation comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Fertilisation)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Insecticide application",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: insecticide.map(
                                                                (value) {
                                                              final selected = selectedInsecticide == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedInsecticide,
                                                                onChanged: (value) => setState(
                                                                        () => selectedInsecticide = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _insecticideController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide insecticide comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Insecticide)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Splitting of multiple seedlings in bags",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: seedlings.map(
                                                                (value) {
                                                              final selected = selectedSeedlings == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedSeedlings,
                                                                onChanged: (value) => setState(
                                                                        () => selectedSeedlings = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _seedlingsController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide splitting of multiple seedlings comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Decapitation)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Leaf Cutting",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: leafcutting.map(
                                                                (value) {
                                                              final selected = selectedLeafCutting == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedLeafCutting,
                                                                onChanged: (value) => setState(
                                                                        () => selectedLeafCutting = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _leafcuttingController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide leaf cutting comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Leaf cutting)'),
                                                ),
                                              ),

                                              Padding(
                                                  padding: const EdgeInsets.only(top: 12.0, bottom: 12),
                                                  child: Expanded(
                                                    child: Column(
                                                      children: [
                                                        const Align(
                                                          alignment: Alignment.bottomLeft,
                                                          child: Padding(
                                                            padding:
                                                            EdgeInsets.only(left: 10.0, bottom: 10),
                                                            child: Text(
                                                              "Weeding Control",
                                                              style: kTextStyle,
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          children: weeding.map(
                                                                (value) {
                                                              final selected = selectedWeeding == value;
                                                              final color = selected
                                                                  ? selectedColor
                                                                  : unSelectedColor;
                                                              return RadioListTile(
                                                                title: Text(
                                                                  value,
                                                                  style: TextStyle(color: color),
                                                                ),
                                                                activeColor: selectedColor,
                                                                value: value,
                                                                groupValue: selectedWeeding,
                                                                onChanged: (value) => setState(
                                                                        () => selectedWeeding = value!),
                                                              );
                                                            },
                                                          ).toList(),
                                                        ),
                                                      ],
                                                    ),
                                                  )),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _weedingController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide weeding comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Weeding control)'),
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, bottom: 8),
                                                child: TextFormField(
                                                  controller: _observationController,
                                                  validator: (value) {
                                                    if (value!.isNotEmpty) {
                                                      return null;
                                                    } else {
                                                      return 'Please, provide observation comment';
                                                    }
                                                  },
                                                  decoration: kInputTextFieldDecoration
                                                      .copyWith(
                                                      labelText:
                                                      'Comments (Additional observation)'),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ))
                                  ),
                                ),
                                onTapConfirm: () async {
                                  try {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<NurseryBloc>().add(
                                        UpdateNursery(
                                          nursery: Nursery(
                                          id: currentNursery.id,
                                          staff_contact:
                                          _staffcontactController.text,
                                          staff_name: _staffnameController.text,
                                          date_capturing: _dateController.text,
                                          nursery_name: selectedFarm,
                                          sector_name:
                                          _sectornameController.text,
                                          decapitation: selectedDecapitation,
                                          watering: selectedWatering,
                                          mulching: selectedMulching,
                                          rearrangement: selectedRearrangement,
                                          fertilisation: selectedFertilisation,
                                          fungicide: selectedFungicide,
                                          insecticide: selectedInsecticide,
                                          seedlings: selectedSeedlings,
                                          leafcutting: selectedLeafCutting,
                                          weeding: selectedWeeding,
                                          segment: _segmentController.text,
                                          cluster_id: _clusterIDController.text,
                                          decapitation_comments:
                                          _decapitationController.text,
                                          watering_comments:
                                          _wateringController.text,
                                          mulching_comments:
                                          _mulchingController.text,
                                          rearrangement_comments:
                                          _rearrangementController.text,
                                          fertilisation_comments:
                                          _fertilisationController.text,
                                          fungicide_comments:
                                          _fungicideController.text,
                                          insecticide_comments:
                                          _insecticideController.text,
                                          seedlings_comments:
                                          _seedlingsController.text,
                                          leafcutting_comments:
                                          _leafcuttingController.text,
                                          weeding_comments:
                                          _weedingController.text,
                                          observation:
                                          _observationController.text,
                                          createdTime: DateTime.now(),
                                        )),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text("Nursery updated successfully"),
                                      ));
                                      context
                                          .read<NurseryBloc>()
                                          .add(const FetchNursery());
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => const NurseryHomePage()));                                    }
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

final TextEditingController _dateController = TextEditingController();
final TextEditingController _staffcontactController = TextEditingController();
final TextEditingController _staffnameController = TextEditingController();
final TextEditingController _sectornameController = TextEditingController();
final TextEditingController _segmentController = TextEditingController();
final TextEditingController _clusterIDController = TextEditingController();
final TextEditingController _decapitationController = TextEditingController();
final TextEditingController _wateringController = TextEditingController();
final TextEditingController _mulchingController = TextEditingController();
final TextEditingController _rearrangementController = TextEditingController();
final TextEditingController _fertilisationController = TextEditingController();
final TextEditingController _fungicideController = TextEditingController();
final TextEditingController _insecticideController = TextEditingController();
final TextEditingController _leafcuttingController = TextEditingController();
final TextEditingController _weedingController = TextEditingController();
final TextEditingController _seedlingsController = TextEditingController();
final TextEditingController _observationController = TextEditingController();
