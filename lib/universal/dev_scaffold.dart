import 'package:devfest_demo/config/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';

class DevScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget tabBar;

  const DevScaffold({
    Key key,
    @required this.title,
    @required this.body,
    this.tabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: BlocProvider.of<ConfigBloc>(context).darkModeOn
          ? Colors.green[800]
          : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            bottom: tabBar,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  BlocProvider.of<ConfigBloc>(context).darkModeOn
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                ),
                onPressed: () {
                  BlocProvider.of<ConfigBloc>(context).add(DarkModeEvent(
                      !BlocProvider.of<ConfigBloc>(context).darkModeOn));
                },
              ),
              IconButton(
                onPressed: () => Share.share(
                    "Download the new DevFest App and share with yout tech friends."),
                icon: Icon(
                  Icons.share,
                  size: 20,
                ),
              )
            ],
          ),
          body: body,
        ),
      ),
    );
  }
}
