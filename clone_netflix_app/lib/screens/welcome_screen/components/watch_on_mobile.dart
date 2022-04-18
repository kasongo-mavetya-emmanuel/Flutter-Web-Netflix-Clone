import 'package:flutter/material.dart';

import '../../../assets.dart';

class WatchOnMobile extends StatelessWidget {
  const WatchOnMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Image.asset(Assets.mobileImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Download your shows\n to watch offline.',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600),),
              SizedBox(height: 10,),
              Text('Save your favorites easily and always have\n something to watch.',style: Theme.of(context).textTheme.headline6!,)
            ],),

        ],
      ),);;
  }
}
