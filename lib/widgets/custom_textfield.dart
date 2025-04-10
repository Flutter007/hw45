import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(label),
        ),

        controller: controller,
        autocorrect: true,
        enableSuggestions: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
