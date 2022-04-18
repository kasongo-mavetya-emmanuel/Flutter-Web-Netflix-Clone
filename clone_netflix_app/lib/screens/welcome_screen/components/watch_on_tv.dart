import 'package:clone_netflix_app/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WatchOnTv extends StatelessWidget {
  const WatchOnTv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Text('Enjoy on your TV.',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600),),
                 SizedBox(height: 10,),
                 Text('Watch on Smart TVs, Playstation, Xbox,\n Chromecast, Apple TV, Blu-ray players, and\n more..',style: Theme.of(context).textTheme.headline6!,)
             ],),
           Image.asset(Assets.tvImage),
        ],
      ),);
  }
}
