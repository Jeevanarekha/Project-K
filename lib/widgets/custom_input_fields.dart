import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onSaved;
  final String regex;
  final String hintText;
  final bool obscureText;

  const CustomTextFormField({super.key, 
    required this.onSaved,
    required this.regex,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (value) => onSaved(value!),
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      validator: (value) {
        return RegExp(regex).hasMatch(value!) ? null : 'Enter a valid value.';
      },
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(30, 29, 37, 1.0),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
