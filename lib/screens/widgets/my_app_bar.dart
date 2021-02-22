///app bar
import 'package:flutter/material.dart';

class MyAppBar extends PreferredSize {
  MyAppBar()
      : super(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 8,
            title: Container(
              padding: EdgeInsets.all(64),
              child: Image.asset('lib/assets/img/New-York-Times-Logo.png'),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 1,
                // color: Colors.grey[300],
              ),
            ),
          ),
        );
}
