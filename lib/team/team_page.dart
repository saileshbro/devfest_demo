import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:devfest_demo/team/team.dart';
import 'package:devfest_demo/universal/dev_scaffold.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamPage extends StatelessWidget {
  static const String routeName = "/team";
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Team",
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: teams.length,
        itemBuilder: (c, i) {
          return Card(
            elevation: 0,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: teams[i].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              teams[i].name,
                              style: Theme.of(context).textTheme.title,
                            ),
                            SizedBox(height: 5),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 1000),
                              width: MediaQuery.of(context).size.width * 0.2,
                              height: 5,
                              color: Tools.multiColors[Random().nextInt(4)],
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          teams[i].desc,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        SizedBox(height: 10),
                        Text(
                          teams[i].desc,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        socialActions(
                          context,
                          fbUrl: teams[i].fbUrl,
                          gitUrl: teams[i].githubUrl,
                          linkedinUrl: teams[i].linkedinUrl,
                          twitterUrl: teams[i].twitterUrl,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget socialActions(context,
          {String fbUrl,
          String twitterUrl,
          String linkedinUrl,
          String gitUrl}) =>
      FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.facebookF,
                size: 15,
              ),
              onPressed: () async {
                await _launchURL(fbUrl);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                size: 15,
              ),
              onPressed: () async {
                await _launchURL(twitterUrl);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.linkedinIn,
                size: 15,
              ),
              onPressed: () async {
                _launchURL(linkedinUrl);
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.github,
                size: 15,
              ),
              onPressed: () async {
                await _launchURL(gitUrl);
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
}
