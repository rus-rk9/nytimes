///апликейшн бар приложения
import 'package:flutter/material.dart';

class MyAppBar extends PreferredSize {
  MyAppBar({
    @required String appBarCaption,
    @required Color greyColor,
  }) : super(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              appBarCaption.toUpperCase(),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 0.5,
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                color: greyColor,
              ),
            ),
          ),
        );
}
