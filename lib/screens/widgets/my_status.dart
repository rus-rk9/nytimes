///статус в карточке
import 'package:flutter/material.dart';

class MyStatus extends Row {
  MyStatus({
    @required String when,
    @required Color greyColor,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Обновлено: ',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: greyColor,
              ),
            ),
            Text(
              when,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        );
}
