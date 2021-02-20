///заголовок карточки
import 'package:flutter/material.dart';

class MyCardCaption extends Column {
  MyCardCaption({
    @required String repCaption,
    @required String username,
    @required String ava,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              repCaption,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.only(top: 4, right: 8, bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(ava),
                    ),
                  ),
                ),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        );
}
