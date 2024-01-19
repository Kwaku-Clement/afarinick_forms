import 'package:afarinick_forms/propagation/Propagation_homepage.dart';
import 'package:back_pressed/back_pressed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../constants/BottomSheet.dart';
import 'propagation_bloc.dart';
import 'propagation_model.dart';

class PropagationDetailPage extends StatefulWidget {
  const PropagationDetailPage({super.key});

  @override
  _PropagationDetailPageState createState() => _PropagationDetailPageState();
}

class _PropagationDetailPageState extends State<PropagationDetailPage>
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
        context.read<PropagationBloc>().add(const FetchPropagation());
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              context.read<PropagationBloc>().add(const FetchPropagation());
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: BlocBuilder<PropagationBloc, PropagationState>(
            builder: (context, state) {
          if (state is DisplaySpecificPropagation) {
            Propagation currentPropagation = state.propagation;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Propagation Form",
                      style: kTextStyle,
                    ),
                  )),
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: SizedBox(
                        height: 100.0,
                        child: Image.asset('images/Kumad_Global.png'),
                      ),
                    ),
                  ),
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Afarinick/Kumad Seedling-Health Form",
                      style: kTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  const Divider(height: 1, color: Colors.black),
                  const SizedBox(
                    height: 18.0,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        "Sucker Reception and Paring",
                        style: kTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      maxLines: null,
                      minLines: null,
                      initialValue: currentPropagation.date_reception,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Date of reception'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                      maxLines: null,
                      minLines: null,
                      initialValue: currentPropagation.truck_number,
                      decoration: kInputTextFieldDecoration.copyWith(
                          labelText: 'Truck Number'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.source_location,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Source Location'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.suppliers_name,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Suppliers Name'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.source_location,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Waybill Quantity'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.suckers_received,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of suckers received'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.suckers_pared,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of suckers pared'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.standard_sized_corms,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of standard sized corms'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.bull_head_corms,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of bull-head corms'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.undersized_corms,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of undersized corms'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.rejected_corms,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of rejected corms'),
                        )),
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
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.corms_buried,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Quantity of corms buried'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.boxes_generated,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Number of Boxes Generated'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.box_code,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Box Code'),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: TextFormField(
                        maxLines: null,
                        minLines: null,
                        initialValue: currentPropagation.individual_corm_box,
                        decoration: kInputTextFieldDecoration.copyWith(
                          labelText: ('Corm quantity per individual box'),
                        )),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          }
          return Container();
        }),
        bottomSheet: ElevatedButton(
          child: Text('Edit', style: kSendButtonTextStyle,),
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
                    child: BlocBuilder<PropagationBloc, PropagationState>(
                        builder: (context, state) {
                          if (state is DisplaySpecificPropagation) {
                            Propagation currentPropagation = state.propagation;
                            return BottomSheetWidget(
                                container: SingleChildScrollView(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          const Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Propagation Form",
                                                  style: kTextStyle,
                                                ),
                                              )),
                                          const Divider(height: 1, color: Colors.black),
                                          const SizedBox(
                                            height: 18.0,
                                          ),
                                          const Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 20.0, bottom: 10),
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
                                              padding: EdgeInsets.only(left: 20.0, bottom: 10),
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
                                                controller: _cormBurried,
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
                                        ],
                                      ),
                                    )
                                  ),
                                ),
                                onTapConfirm: () async {
                                  try {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<PropagationBloc>().add(
                                        UpdatePropagation(
                                            propagation: Propagation(
                                              id: currentPropagation.id,
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
                                              corms_buried: _cormBurried.text,
                                              boxes_generated: _boxesGenerated.text,
                                              individual_corm_box: _individualBox.text,
                                              createdTime: DateTime.now(),
                                            )),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: Text("Propagation added successfully"),
                                      ));
                                      context
                                          .read<PropagationBloc>()
                                          .add(const FetchPropagation());
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                                          builder: (context) => const PropagationHomepage()));                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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

final TextEditingController _dateReception = TextEditingController();
final TextEditingController _truckNumber = TextEditingController();
final TextEditingController _sourceLocation = TextEditingController();
final TextEditingController _suppliersName = TextEditingController();
final TextEditingController _cormBurried = TextEditingController();
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
