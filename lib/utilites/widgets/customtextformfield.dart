import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color hinnntcolr;
  final IconData? perfixicon;
  final IconData? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.hinnntcolr = Colors.black,
    this.perfixicon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: hinnntcolr),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusColor: Colors.white,
        prefixIcon: perfixicon != null ? Icon(perfixicon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      ),
      validator: validator!,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
