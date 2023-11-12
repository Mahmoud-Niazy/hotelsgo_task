import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color ;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool underline ;
  final Color underlineColor ;

   const CustomTextButton({
    super.key,
     this.onPressed,
    required this.text,
    this.color = Colors.grey,
     this.fontSize ,
     this.fontWeight = FontWeight.w700,
     this.underline = false,
     this.underlineColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: underline? TextDecoration.underline : TextDecoration.none,
          decorationColor: underlineColor,
          decorationThickness: 2,
        ),
      ),
    );
  }
}