///индикатор загрузки
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/bloc/logic.dart';
import 'package:nytimes/bloc/states.dart';

class MyLoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        if (state is RepoLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        return SizedBox();
      },
    );
  }
}
