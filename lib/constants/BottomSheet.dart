import 'package:flutter/material.dart';

import 'constants.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget container;
  final VoidCallback onTapConfirm;
  final VoidCallback onTapClose;

  const BottomSheetWidget(
      {super.key,
      required this.onTapConfirm,
      required this.onTapClose,
      required this.container});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        container,
        buildButtons(),
      ],
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: onTapClose,
          child: const Text('CANCEL',
              style: TextStyle(color: Colors.orangeAccent)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: onTapConfirm,
              child: Text(
                'UPDATE',
                style: kSendButtonTextStyle.copyWith(color: Colors.green),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
