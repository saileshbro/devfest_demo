import 'package:devfest_demo/agenda/agenda_page.dart';
import 'package:devfest_demo/home/home_page.dart';
import 'package:devfest_demo/speakers/speaker_page.dart';
import 'package:devfest_demo/sponsers/sponsers_page.dart';
import 'package:devfest_demo/team/team_page.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;
  @override
  void initState() {
    setupApp();
    super.initState();
  }

  setupApp() {
    configBloc = ConfigBloc();
    configBloc.darkModeOn = Devfest.prefs.getBool(Devfest.darkModePref) ?? true;
  }

  @override
  void dispose() {
    configBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (BuildContext context, ConfigState state) {
          return MaterialApp(
            title: "Google DevFest",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: Devfest.google_sans_family,
              primarySwatch: Colors.red,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: configBloc.darkModeOn
                        ? ColorScheme.dark()
                        : ColorScheme.dark(),
                  ),
              appBarTheme: AppBarTheme(elevation: 0.0),
            ),
            home: HomePage(),
            routes: <String, WidgetBuilder>{
              HomePage.routeName: (context) => HomePage(),
              AgendaPage.routeName: (context) => AgendaPage(),
              SpeakersPage.routeName: (context) => SpeakersPage(),
              TeamPage.routeName: (context) => TeamPage(),
              SponsorPage.routeName: (context) => SponsorPage(),
            },
          );
        },
      ),
    );
  }
}
