///экран результатов
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';
import 'package:nytimes/bloc/states.dart';
import 'package:nytimes/screens/widgets/my_card.dart';
import 'widgets/my_app_bar.dart';
import 'widgets/my_text.dart';

class Results extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        appBarCaption: 'РЕЗУЛЬТАТ ПОИСКА',
        greyColor: BlocProvider.of<AppBloc>(context).myColor['grey'],
      ),
      body: MyBody(),
    );
    // );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, Color> myColor =
        BlocProvider.of<AppBloc>(context).myColor;
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        if (state is RepoLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: 'ПО ЗАПРОСУ: ',
                    color: myColor['greyText'],
                  ),
                  MyText(
                    text: '"${state.searchValue}"',
                    color: myColor['blue'],
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              MyText(
                text: 'НАЙДЕНО: ${state.repos.length}',
                color: myColor['greyText'],
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.repos.length,
                  itemBuilder: (context, i) {
                    return MyCard(
                      repCaption: state.repos[i].name,
                      username: state.repos[i].userName,
                      avatar: state.repos[i].avaURL,
                      borderColor: myColor['grey'],
                      backgroundColor: myColor['greyText'],
                      rate: state.repos[i].rate,
                      date: state.repos[i].dt,
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
