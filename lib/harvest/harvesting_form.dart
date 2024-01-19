import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/constants.dart';
import 'harvest_bloc.dart';

class HarvestingForm extends StatefulWidget {
  const HarvestingForm({super.key});

  @override
  State<HarvestingForm> createState() =>
      _HarvestingFormState();
}

final _formKey = GlobalKey<FormState>();

class _HarvestingFormState extends State<HarvestingForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Harvesting Activities-Form",
                  style: kTextStyle,
                ),
              )),
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
                  style: kTextStyle,
                ),
              )),
              const SizedBox(
                height: 10.0,
              ),

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
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Quantity of Soil and Sawdust',
                    validation: true,
                    controller: _soilSawdust,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide quantity of soil and sawdust',
                    key: 'Quantity of Soil and Sawdust',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Quantity of Sand and Sawdust',
                    validation: true,
                    controller: _sandSawdust,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide quantity of sand and sawdust',
                    key: 'Quantity of Sand and Sawdust',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Other Comment',
                    validation: true,
                    controller: _other,
                    keyboardType: TextInputType.text,
                    validationErrorMsg: 'Please, provide other comment',
                    key: 'Other Comment',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue:
                        'Quantity of Nursery Bags Requested and Received',
                    validation: true,
                    controller: _nBagsRequested,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide of nursery bags requested and received',
                    key: 'Quantity of bags received',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Quantity of Nursery Bags Filled',
                    validation: true,
                    controller: _nBagsFilled,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide quantity nursery bags filled',
                    key: 'Quantity of nursery bags filled',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Quantity of Clusters Arranged',
                    validation: true,
                    controller: _clustersArranged,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide quantity of clusters arranged',
                    key: 'Quantity of clusters arranged',
                  ),
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
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Box Code',
                    validation: true,
                    controller: _boxCode,
                    keyboardType: TextInputType.text,
                    validationErrorMsg: 'Please, provide the Box code',
                    key: 'Box Code',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Quantity Harvested',
                    validation: true,
                    controller: _quantityHarvested,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide the quantity harvested',
                    key: 'Quantity Harvested',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Loss Quantity',
                    validation: true,
                    controller: _lossQuantity,
                    keyboardType: TextInputType.text,
                    validationErrorMsg: 'Please, provide the quantity Loss',
                    key: 'Loss Quantity',
                  ),
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
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Transplanted Cluster Code',
                    validation: true,
                    controller: _clusterCode,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide the transplanted cluster code',
                    key: 'Transplanted Cluster code',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Expanded(
                  child: FormsTextUtils().getCustomEditTextArea(
                    labelValue: 'Quantity of Seedlings per Cluster',
                    validation: true,
                    controller: _seedlingsPerCluster,
                    keyboardType: TextInputType.text,
                    validationErrorMsg:
                        'Please, provide the quantity of seedlings per cluster',
                    key: 'Quantity of seedlings per cluster',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28),
                child: BlocBuilder<HarvestBloc, HarvestState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              context.read<HarvestBloc>().add(
                                    AddHarvest(
                                      comment: _other.text,
                                      nursery_bags_requested:
                                          _nBagsRequested.text,
                                      transplanted_cluster_code:
                                          _clusterCode.text,
                                      seedlings_cluster:
                                          _seedlingsPerCluster.text,
                                      nursery_bags_filled: _nBagsFilled.text,
                                      clusters_arranged: _clustersArranged.text,
                                      box_code: _boxCode.text,
                                      harvested: _quantityHarvested.text,
                                      loss_quantity: _lossQuantity.text,
                                      soil_sawdust: _soilSawdust.text,
                                      sand_sawdust: _sandSawdust.text,
                                      createdTime: DateTime.now(),
                                    ),
                                  );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("harvest added successfully"),
                              ));
                              context
                                  .read<HarvestBloc>()
                                  .add(const FetchHarvests());
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                e.toString(),
                              ),
                            ));
                          }
                        },
                        child: const Text('Add Harvesting'));
                  },
                ),
              ),
            ],
          ),
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
