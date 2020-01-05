import 'package:devfest_demo/config/index.dart';
import 'package:devfest_demo/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
      ),
      decoration: BoxDecoration(
        color: BlocProvider.of<ConfigBloc>(context).darkModeOn
            ? Tools.hexToColor("#1f2124")
            : Colors.white,
       ),
    );
  }
}
