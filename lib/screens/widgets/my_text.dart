///text

import 'package:flutter/material.dart';

class MyText extends ListView {
  MyText({
    @required String text,
  }) : super(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(text),
            ),
          ],
        );
}
