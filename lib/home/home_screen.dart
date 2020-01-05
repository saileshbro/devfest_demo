import 'package:devfest_demo/home/home_widgets/home_front.dart';
import 'package:devfest_demo/home/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required HomeBloc homeBloc})
      : _homeBloc = homeBloc,
        super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  final HomeBloc _homeBloc;
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget._homeBloc.add(LoadHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeBloc, HomeState>(
      bloc: widget._homeBloc,
      builder: (BuildContext context, HomeState state) {
        if (state is UnHomeState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return HomeFront();
      },
    );
  }
}
