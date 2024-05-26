import 'package:drive_app/utilites/widgets/customtext.dart';
import 'package:flutter/material.dart';

class MyDialog extends StatelessWidget {
  const MyDialog(
      {super.key, required this.onPressedyes, required this.onPressedNo});
  final Function() onPressedyes;
  final Function() onPressedNo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('Do you want to create a new trip?'),
      actions: <Widget>[
        // Yes button
        TextButton(
          onPressed: onPressedyes,
          child: const CustomText(
            text: 'Yes',
          ),
        ),
        // No button
        TextButton(
          onPressed: onPressedNo,
          child: const Text('No'),
        ),
      ],
    );
  }
}
