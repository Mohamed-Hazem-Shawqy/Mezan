import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final String? hintText;
  final bool obScure;
  final TextInputType? keypord;
  final Widget? suffixIcon;
  const CustomTextField(
      {super.key,
      this.controller,
      this.labelText,
      this.validator,
      this.hintText,
      required this.obScure,
      this.keypord, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      keyboardType:keypord,
      obscuringCharacter: '\$',
      obscureText: obScure,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: labelText,
        hintText: hintText,
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(),
      ),
    );
  }
}
