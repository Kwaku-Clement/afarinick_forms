import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightGreen,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);



const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);


const kInputTextFieldDecoration = InputDecoration(
  labelText: 'Enter your value',
  labelStyle: TextStyle(color: Colors.black87, fontSize: 15),
  contentPadding: EdgeInsets.only(top: 20.0, left: 5.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(9.0)),
  ),
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(9.0)),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black87, width: 1.0),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(9.0), topRight: Radius.circular(9.0)),
  ),
);

const kTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);

class FormsTextUtils {
  TextFormField getCustomEditTextArea({required String labelValue,
    required String key,
    required bool validation,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    required String validationErrorMsg}) {
    TextFormField textFormField = TextFormField(
        maxLines: null,
        minLines: null,
        keyboardType: keyboardType,
        controller: controller,
        validator: (value) {
          if (value != "") {
            return null;
          } else {
            return validationErrorMsg;
          }
        },
        decoration: kInputTextFieldDecoration.copyWith(labelText: labelValue));
    return textFormField;
  }
}

  final farm = <String>[
    'Nobekaw',
    'Manso Amenfi',
    'Koforidua',
    'Akontombra',
    'Dodi Papase',
    'Dadieso'
  ];
  final List<String> decapitation = <String>[
    'Yes',
    'No',
  ];
  final List<String> watering = <String>[
    'Yes',
    'No',
  ];
  final List<String> mulching = <String>[
    'Yes',
    'No',
  ];
  final List<String> rearrangement = <String>[
    'Yes',
    'No',
  ];
  final List<String> fertigation = <String>[
    'Yes',
    'No',
  ];
  final List<String> fungicide = <String>[
    'Yes',
    'No',
  ];
  final List<String> insecticide = <String>[
    'Yes',
    'No',
  ];
  final List<String> seedlings = <String>[
    'Yes',
    'No',
  ];
  final List<String> leafcutting = <String>[
    'Yes',
    'No',
  ];
  const List<String> weeding = <String>[
    'Yes',
    'No',
  ];

  String selectedFarm = farm.first;
  String selectedWeeding = weeding.first;
  String selectedWatering = watering.first;
  String selectedLeafCutting = leafcutting.first;
  String selectedSeedlings = seedlings.first;
  String selectedInsecticide = insecticide.first;
  String selectedMulching = mulching.first;
  String selectedRearrangement = rearrangement.first;
  String selectedFungicide = fungicide.first;
  String selectedFertilisation = fertigation.first;
  String selectedDecapitation = decapitation.first;

  const selectedColor = Colors.green;
  const unSelectedColor = Colors.black;

