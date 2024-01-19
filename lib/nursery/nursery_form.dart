import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import 'nursery_bloc.dart';

class NurseryForm extends StatefulWidget {
  const NurseryForm({super.key});

  @override
  _NurseryFormState createState() => _NurseryFormState();
}

class _NurseryFormState extends State<NurseryForm>
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
    return Scaffold(
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
          title:  const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Nursery Activities-Form",
                  style: kTextStyle,
                ),
              )),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 100.0,
                        child: Image.asset('assets/images/Kumad_Global.png'),
                      ),
                    ),
                  ),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Afarinick/Kumad Seedling-Health Form",
                      textAlign: TextAlign.center,
                      style: kTextStyle,
                    ),
                  )),
                  const SizedBox(
                    height: 10.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Date of capturing',
                        validation: true,
                        controller: _dateController,
                        validationErrorMsg: 'Please, provide Date of capturing',
                        key: 'Date of capturing',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Staff Contact',
                        validation: true,
                        controller: _staffcontactController,
                        validationErrorMsg: 'Please, provide staff contact',
                        key: 'staff contact',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Name of Staff',
                        validation: true,
                        controller: _staffnameController,
                        validationErrorMsg: 'Please, provide name of staff',
                        key: 'Name of staff',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Name of the nursery:",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Sector Name',
                        validation: true,
                        controller: _sectornameController,
                        validationErrorMsg: 'Please, provide sector name',
                        key: 'sector name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Segment',
                        validation: true,
                        controller: _segmentController,
                        validationErrorMsg: 'Please, provide the segment',
                        key: 'segment',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Cluster ID',
                        validation: true,
                        controller: _clusterIDController,
                        validationErrorMsg: 'Please, provide cluster ID',
                        key: 'cluster id',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Was Decapitation done?",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Decapitation)',
                        validation: true,
                        controller: _decapitationController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Was Watering done?",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Watering)',
                        validation: true,
                        controller: _wateringController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Mulching",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Mulching)',
                        validation: true,
                        controller: _mulchingController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Re-arrangement",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Rearrangement)',
                        validation: true,
                        controller: _rearrangementController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Fertilisation",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Fertilisation)',
                        validation: true,
                        controller: _fertigationController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Insecticide application",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Insecticide)',
                        validation: true,
                        controller: _insecticideController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Splitting of multiple seedlings in bags",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue:
                            'Comments (Splitting of multiple seedlings)',
                        validation: true,
                        controller: _splitingController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Leaf Cutting",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Leaf cutting)',
                        validation: true,
                        controller: _leafcuttingController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Expanded(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Weeding Control",
                                style: kTextStyle,
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
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Weeding control)',
                        validation: true,
                        controller: _weedingController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Expanded(
                      child: FormsTextUtils().getCustomEditTextArea(
                        labelValue: 'Comments (Additional observation',
                        validation: true,
                        controller: _additionalController,
                        validationErrorMsg: 'Please, provide comments',
                        key: 'comments',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, right: 28),
                    child: BlocBuilder<NurseryBloc, NurseryState>(
                      builder: (context, state) {
                        return ElevatedButton(
                            onPressed: () async {
                              try {
                                if (_formKey.currentState!.validate()) {
                                  context.read<NurseryBloc>().add(
                                        AddNursery(
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
                                              _fertigationController.text,
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
                                        ),
                                      );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("harvest added successfully"),
                                  ));
                                  context
                                      .read<NurseryBloc>()
                                      .add(const FetchNursery());
                                  Navigator.pop(context);
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    e.toString(),
                                  ),
                                ));
                              }
                            },
                            child: const Text('SUBMIT', style: TextStyle(color: Colors.green, fontSize: 18.0)),);
                      },
                    ),
                  ),
                ],
              ),
            ))
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
final TextEditingController _fertigationController = TextEditingController();
final TextEditingController _fungicideController = TextEditingController();
final TextEditingController _insecticideController = TextEditingController();
final TextEditingController _splitingController = TextEditingController();
final TextEditingController _leafcuttingController = TextEditingController();
final TextEditingController _weedingController = TextEditingController();
final TextEditingController _additionalController = TextEditingController();
final TextEditingController _seedlingsController = TextEditingController();
final TextEditingController _observationController = TextEditingController();
