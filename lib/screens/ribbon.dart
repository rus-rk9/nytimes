///экран результатов
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';
import 'package:nytimes/bloc/states.dart';
import 'package:nytimes/screens/widgets/my_card.dart';

class Ribbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MyBody(),
    );
    // );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        if (state is RepoLoadedState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.repos.length,
                  itemBuilder: (context, i) {
                    return MyCard(
                      title: state.repos[i].name,
                      abstr: state.repos[i].name,
                      username: state.repos[i].userName,
                      avatar: state.repos[i].avaURL,
                      published: state.repos[i].dt,
                      updated: state.repos[i].dt,
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    MyCard(
                      title:
                          'Republicans Struggle to Derail Increasingly Popular Stimulus Package',
                      abstr:
                          'Polls show a \$1.9 trillion rescue plan polls strongly across the country, including with many Republican voters, despite a scattershot series of attacks from congressional Republicans.',
                      username: 'By Emily Cochrane and Jim Tankersley',
                      avatar:
                          'https://static01.nyt.com/images/2021/02/19/us/19dc-stimulus/19dc-stimulus-thumbStandard.jpg',
                      published: '2021-02-19T17:55:48-05:00',
                      updated: '2021-02-19T21:39:51-05:00',
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
