import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.onChanged})
      : initialValue = null,
        validator = null,
        isFormField = false;

  const CustomTextField.formField({
    super.key,
    this.initialValue,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
  }) : isFormField = true;

  final String? initialValue;
  final String? hintText;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final bool isFormField;

  @override
  Widget build(BuildContext context) {
    if (!isFormField) {
      return TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
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
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 3),
        ),
        disabledBorder: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
