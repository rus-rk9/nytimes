///текст в экранах
import 'package:flutter/material.dart';

class MyText extends Text {
  MyText({
    @required String text,
    @required Color color,
  }) : super(
          text,
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        );
}
