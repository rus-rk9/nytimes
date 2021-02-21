///ribbon
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';
import 'package:nytimes/bloc/states.dart';
import 'package:nytimes/bloc/events.dart';
import 'package:nytimes/screens/widgets/my_card.dart';
import 'package:nytimes/screens/widgets/my_text.dart';

class Ribbon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MyBody(),
      ),
    );
    // );
  }
}

class MyBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        Widget result = MyText(text: 'Pull down to refresh ...');

        if (state is StateRibbonItemEmpty) {
          result = MyText(text: 'No data found. Pull down to refresh ...');
        }

        if (state is StateRibbonItemError) {
          result = MyText(text: 'Unknown error. Pull down to refresh ...');
        }

        if (state is StateRibbonItemLoading) {
          result = Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is StateRibbonItemLoaded) {
          result = Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.items.length,
                  itemBuilder: (context, i) {
                    return MyCard(
                      title: state.items[i].title,
                      abstr: state.items[i].abstr,
                      username: state.items[i].username,
                      avatar: state.items[i].avatar,
                      published: state.items[i].published,
                      updated: state.items[i].updated,
                    );
                  },
                ),
              ),
            ],
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<AppBloc>(context).add(
              EventRibbonItemsGet(),
            );
          },
          child: result,
        );
      },
    );
  }
}
