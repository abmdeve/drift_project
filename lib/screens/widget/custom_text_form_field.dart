import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String textLabel;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$textLabel cannot be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(textLabel),
      ),
    );
  }
}
