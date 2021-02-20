///виджет рейта в карточке
import 'package:flutter/material.dart';

class MyRate extends Container {
  MyRate({
    @required int val,
    @required Color backgroundColor,
  }) : super(
          // width: 45,
          height: 24,
          padding: EdgeInsets.only(left: 7, right: 7),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.star_border,
                color: Colors.white,
                size: 16,
              ),
              Text(
                '$val',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
}
