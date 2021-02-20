///карточка
import 'package:flutter/material.dart';
import 'package:nytimes/screens/widgets/my_card_caption.dart';
import 'my_rate.dart';
import 'my_status.dart';

class MyCard extends Container {
  MyCard({
    @required String repCaption,
    @required String username,
    @required String avatar,
    @required Color borderColor,
    @required Color backgroundColor,
    @required int rate,
    @required String date,
  }) : super(
          height: 111,
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          padding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: borderColor,
              style: BorderStyle.solid,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyCardCaption(
                    repCaption: repCaption,
                    username: username,
                    ava: avatar,
                  ),
                  Column(
                    children: [
                      MyRate(
                        val: rate,
                        backgroundColor: backgroundColor,
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 1,
                color: borderColor,
              ),
              Container(
                padding: EdgeInsets.only(top: 12),
                child: MyStatus(
                  when: date,
                  greyColor: backgroundColor,
                ),
              ),
            ],
          ),
        );
}
