import 'package:devfest_demo/agenda/agenda_page.dart';
import 'package:devfest_demo/config/index.dart';
import 'package:devfest_demo/speakers/speaker_page.dart';
import 'package:devfest_demo/sponsers/sponsers_page.dart';
import 'package:devfest_demo/team/team_page.dart';
import 'package:devfest_demo/universal/image_card.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeFront extends StatelessWidget {
  List<Widget> devFestTexts(context) => [
        Text(
          Devfest.welcomeText,
          style: Theme.of(context).textTheme.headline,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          Devfest.descText,
          style: Theme.of(context).textTheme.caption,
          textAlign: TextAlign.center,
        )
      ];
  Widget newActions(context) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: <Widget>[
          ActionCard(
            color: Colors.red,
            onPressed: () {
              Navigator.of(context).pushNamed(AgendaPage.routeName);
            },
            icon: Icons.schedule,
            title: Devfest.agenda_text,
          ),
          ActionCard(
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).pushNamed(SpeakersPage.routeName);
            },
            icon: Icons.person,
            title: Devfest.speakers_text,
          ),
          ActionCard(
            color: Colors.amber,
            onPressed: () {
              Navigator.of(context).pushNamed(TeamPage.routeName);
            },
            icon: Icons.people,
            title: Devfest.team_text,
          ),
          ActionCard(
            color: Colors.purple,
            onPressed: () {
              Navigator.of(context).pushNamed(SponsorPage.routeName);
            },
            icon: Icons.attach_money,
            title: Devfest.sponsor_text,
          ),
          ActionCard(
            color: Colors.brown,
            onPressed: () {},
            icon: Icons.question_answer,
            title: Devfest.faq_text,
          ),
          ActionCard(
            color: Colors.blue,
            onPressed: () {},
            icon: Icons.map,
            title: Devfest.map_text,
          ),
        ],
      );
  Widget socialActions(context) => FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(FontAwesomeIcons.facebookF),
              onPressed: () async {
                await _launchURL("https://facebook.com/saileshbro");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.twitter),
              onPressed: () async {
                await _launchURL("https://twitter.com/sail_sail39=0");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.linkedinIn),
              onPressed: () async {
                _launchURL("https://linkedin.com/in/saileshbro");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.youtube),
              onPressed: () async {
                await _launchURL("https://flutter.dev/youtube");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.meetup),
              onPressed: () async {
                await _launchURL("https://meetup.com/");
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.envelope),
              onPressed: () async {
                var emailUrl =
                    '''mailto:saileshbro@gmail.com?subject=Support Needed For DevFest App&body={Name: Sailesh Dahal},Email: saileshbro@gmail.com}''';
                var out = Uri.encodeFull(emailUrl);
                await _launchURL(out);
              },
            ),
          ],
        ),
      );
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ImageCard(
              image: BlocProvider.of<ConfigBloc>(context).darkModeOn
                  ? Devfest.banner_dark
                  : Devfest.banner_light,
            ),
            SizedBox(
              height: 20,
            ),
            ...devFestTexts(context),
            SizedBox(
              height: 20,
            ),
            newActions(context),
            SizedBox(
              height: 20,
            ),
            socialActions(context),
            SizedBox(
              height: 20,
            ),
            Text(
              Devfest.app_version,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Color color;

  const ActionCard({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onPressed,
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            color: BlocProvider.of<ConfigBloc>(context).darkModeOn
                ? Tools.hexToColor("#1F2124")
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: BlocProvider.of<ConfigBloc>(context).darkModeOn
                ? []
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 5,
                    )
                  ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: color,
            ),
            SizedBox(height: 10),
            Text(title)
          ],
        ),
      ),
    );
  }
}
