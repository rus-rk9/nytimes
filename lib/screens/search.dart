///экран поиска
import 'package:flutter/material.dart';
import 'package:nytimes/bloc/events.dart';

import 'package:nytimes/screens/widgets/my_button.dart';
import 'package:nytimes/screens/widgets/my_loading_circle.dart';
import 'widgets/my_app_bar.dart';
import 'widgets/my_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        appBarCaption: 'ПОИСК',
        greyColor: BlocProvider.of<AppBloc>(context).myColor['grey'],
      ),
      body: MyBody(),
    );
  }
}

class MyBody extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map<String, Color> myColor =
        BlocProvider.of<AppBloc>(context).myColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 85,
          child: MyLoadingCircle(),
        ),
        Container(
          height: 50,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: myColor['grey'],
              style: BorderStyle.solid,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    maxLines: 1,
                    controller: searchTextController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),

              ///чтобы анимация нажатия не выходила за рамки
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: MyButton(
                  caption: 'найти',
                  blueColor: myColor['blue'],
                  onPressed: () {
                    BlocProvider.of<AppBloc>(context).add(
                      RepoSearchEvent(
                        searchValue: searchTextController.text.trim(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
