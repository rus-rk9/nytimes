///кнопка
import 'package:flutter/material.dart';

class MyButton extends FlatButton {
  MyButton({
    @required String caption,
    @required Color blueColor,
    @required Function onPressed,
  }) : super(
          padding: EdgeInsets.all(4),
          child: Container(
            width: 100,
            height: double.infinity,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                caption.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          onPressed: onPressed,
        );
}
