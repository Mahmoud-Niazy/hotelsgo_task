import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;

  const CustomTextFormField({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 0),
              spreadRadius: 10,
              blurRadius: 10
          ),
        ],
      ),
      child:  TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
