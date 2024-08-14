import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.keyboardType,
      required this.action});

  final TextEditingController controller;
  final String hint;
  final TextInputAction action;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontSize: 16,
        color: Color(0x6867775C),
        fontWeight: FontWeight.w500);

    return SizedBox(
      height: 42,
      child: TextFormField(
          keyboardType: TextInputType.text,
          style: const TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
              hintStyle: textStyle,
              contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFE2E3E4)),
                  borderRadius: BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFFE2E3E4)),
                  borderRadius: BorderRadius.circular(12)),
              hintText: hint,
              filled: true,
              fillColor: const Color(0xFFFFFFFF)),
          controller: controller),
    );
  }
}
