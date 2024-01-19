import 'package:afarinick_forms/propagation/propagation_bloc.dart';
import 'package:back_pressed/back_pressed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';

class PropagationForm extends StatefulWidget {
  const PropagationForm({super.key});

  @override
  State<PropagationForm> createState() => _PropagationFormState();
}

final _formKey = GlobalKey<FormState>();

class _PropagationFormState extends State<PropagationForm> {
  @override
  Widget build(BuildContext context) {
    return OnBackPressed(
      perform: (){
        context.read<PropagationBloc>().add(const FetchPropagation());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<PropagationBloc>().add(const FetchPropagation());
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
                    "Harvesting and Transplanting-Form",
                    style: kTextStyle,
                    textAlign: TextAlign.center,
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

                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 10),
                    child: Text(
                      "Sucker Reception and Paring",
                      style: kTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Date of reception',
                      validation: true,
                      controller: _dateReception,
                      validationErrorMsg: 'Please, provide date of reception',
                      key: 'date',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Truck Number',
                      validation: true,
                      controller: _truckNumber,
                      validationErrorMsg: 'Please, provide truck number',
                      key: 'truck number',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Source Location',
                      validation: true,
                      controller: _sourceLocation,
                      validationErrorMsg: 'Please, provide source location',
                      key: 'source location',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Suppliers Name',
                      validation: true,
                      controller: _suppliersName,
                      validationErrorMsg: 'Please, provide Suppliers Name',
                      key: 'Suppliers Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Waybill Quantity',
                      validation: true,
                      controller: _waybillQuantity,
                      validationErrorMsg: 'Please, provide Waybill Quantity',
                      key: 'Waybill Quantity',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of suckers received',
                      validation: true,
                      controller: _suckersReceived,
                      validationErrorMsg:
                          'Please, provide quantity of suckers received',
                      key: 'Quantity of suckers received',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of suckers pared',
                      validation: true,
                      controller: _suckersPared,
                      validationErrorMsg:
                          'Please, provide quantity of suckers pared',
                      key: 'Quantity of suckers pared',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of standard sized corms',
                      validation: true,
                      controller: _standardSizedCorms,
                      validationErrorMsg:
                          'Please, provide quantity of standard sized corms',
                      key: 'Quantity of standard sized corms',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of bull-head corms',
                      validation: true,
                      controller: _bullHeadCorms,
                      validationErrorMsg:
                          'Please, provide quantity of bull-head corms',
                      key: 'Quantity of bull-head corms',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of undersized corms',
                      validation: true,
                      controller: _undersizedCorms,
                      validationErrorMsg:
                          'Please, provide quantity of undersized corms',
                      key: 'Quantity of undersized corms',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of rejected corms',
                      validation: true,
                      controller: _rejectedCorms,
                      validationErrorMsg:
                          'Please, provide quantity of rejected corms',
                      key: 'Quantity of rejected corms',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 10),
                    child: Text(
                      "Corm Burying",
                      style: kTextStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Quantity of corms buried',
                      validation: true,
                      controller: _cormBuried,
                      validationErrorMsg:
                          'Please, provide quantity of corms buried',
                      key: 'Quantity of corms buried',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Number of Boxes Generated',
                      validation: true,
                      controller: _boxesGenerated,
                      validationErrorMsg:
                          'Please, provide number of boxes generated',
                      key: 'Number of boxes generated',
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
                      validationErrorMsg: 'Please, provide the box code',
                      key: 'Box code',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Expanded(
                    child: FormsTextUtils().getCustomEditTextArea(
                      labelValue: 'Corm Quantity per Individual Box',
                      validation: true,
                      controller: _individualBox,
                      validationErrorMsg:
                          'Please, provide corm quantity per individual box',
                      key: 'Corm quantity per individual box',
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0, right: 28),
                  child: BlocBuilder<PropagationBloc, PropagationState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () async {
                            try {
                              if (_formKey.currentState!.validate()) {
                                context.read<PropagationBloc>().add(
                                  AddPropagation(
                                    truck_number: _truckNumber.text,
                                    source_location: _sourceLocation.text,
                                    date_reception: _dateReception.text,
                                    suppliers_name: _suppliersName.text,
                                    waybill_quantity: _waybillQuantity.text,
                                    suckers_received: _suckersReceived.text,
                                    suckers_pared: _suckersPared.text,
                                    box_code: _boxCode.text,
                                    standard_sized_corms:
                                    _standardSizedCorms.text,
                                    bull_head_corms: _bullHeadCorms.text,
                                    undersized_corms: _undersizedCorms.text,
                                    rejected_corms: _rejectedCorms.text,
                                    corms_buried: _cormBuried.text,
                                    boxes_generated: _boxesGenerated.text,
                                    individual_corm_box: _individualBox.text,
                                    createdTime: DateTime.now(),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  duration: Duration(seconds: 1),
                                  content: Text("propagation added successfully"),
                                ));
                                context
                                    .read<PropagationBloc>()
                                    .add(const FetchPropagation());
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
                          child: const Text('SUBMIT'));
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

final TextEditingController _dateReception = TextEditingController();
final TextEditingController _truckNumber = TextEditingController();
final TextEditingController _sourceLocation = TextEditingController();
final TextEditingController _suppliersName = TextEditingController();
final TextEditingController _cormBuried = TextEditingController();
final TextEditingController _boxesGenerated = TextEditingController();
final TextEditingController _boxCode = TextEditingController();
final TextEditingController _individualBox = TextEditingController();
final TextEditingController _waybillQuantity = TextEditingController();
final TextEditingController _suckersReceived = TextEditingController();
final TextEditingController _suckersPared = TextEditingController();
final TextEditingController _standardSizedCorms = TextEditingController();
final TextEditingController _bullHeadCorms = TextEditingController();
final TextEditingController _undersizedCorms = TextEditingController();
final TextEditingController _rejectedCorms = TextEditingController();
