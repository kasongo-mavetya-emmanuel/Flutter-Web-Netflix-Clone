import 'package:clone_netflix_app/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundHeaderImage extends StatelessWidget {
  const BackgroundHeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(Assets.coverImage,fit: BoxFit.cover,),
        Container(decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black.withOpacity(0.8),Colors.transparent,Colors.black.withOpacity(0.6)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
        ),),
      ]
    );
  }
}
