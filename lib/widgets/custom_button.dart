import 'package:flutter/material.dart';

TextButton customButton(
  String text, 
  Color backgroundColor, 
  Function onClick, {
    Color textColor = Colors.white,
    FontWeight? fontWeight,
    IconData? customIcon,
    ImageProvider? imageIcon
  }) {

  fontWeight = fontWeight ?? FontWeight.normal;

  return TextButton(
    onPressed: (() => onClick()),
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      
    ),
    child: Container(
      width: double.infinity,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        if(customIcon != null && imageIcon == null) 
          Icon(customIcon),
        if(imageIcon != null && customIcon == null)
          ImageIcon(imageIcon),
        Text( 
          text,
          style: TextStyle(
            letterSpacing: -1,
            fontWeight: fontWeight,
            color: textColor,
              fontFamily: 'Modica',
          ),
        )
      ]),
    ),
  );
}