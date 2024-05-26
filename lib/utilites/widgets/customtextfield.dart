import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;

  const CustomTextField(
      {this.labelText,
      this.hintText,
      this.contentPadding,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.multiline,
          maxLines: 12,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ));
  }
}
