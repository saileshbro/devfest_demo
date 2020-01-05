import 'package:devfest_demo/home/home_bloc.dart';
import 'package:devfest_demo/home/home_screen.dart';
import 'package:devfest_demo/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Home",
      body: HomeScreen(
        homeBloc: HomeBloc(),
      ),
    );
  }
}
