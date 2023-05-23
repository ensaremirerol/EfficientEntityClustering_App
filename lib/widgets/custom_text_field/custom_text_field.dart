import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.obscureText,
      this.trailing,
      this.onChanged})
      : initialValue = null,
        validator = null,
        isFormField = false;

  const CustomTextField.formField(
      {super.key,
      this.initialValue,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.validator,
      this.onChanged,
      this.trailing,
      this.obscureText})
      : isFormField = true;

  final String? initialValue;
  final String? hintText;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isFormField;
  final bool? obscureText;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    if (!isFormField) {
      return TextField(
        key: key,
        controller: controller,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
          hintText: hintText,
          suffix: trailing,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 3),
          ),
          disabledBorder: const OutlineInputBorder(),
          prefixIcon: prefixIcon,
        ),
        onChanged: onChanged,
      );
    }
    return TextFormField(
      key: key,
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        suffix: trailing,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 3),
        ),
        disabledBorder: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
