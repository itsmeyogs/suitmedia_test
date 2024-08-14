import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget{
  const RoundButton({super.key, required this.onPressed, required this.label});

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF2B637B)),
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              textStyle: WidgetStateProperty.all<TextStyle>(const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "Poppins")),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
              ))
          ),
          onPressed: onPressed,
          child: Text(label,)),
    );
  }



}