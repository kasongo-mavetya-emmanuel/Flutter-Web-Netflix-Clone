import 'package:clone_netflix_app/screens/registration_screens/signin_screen.dart';
import 'package:clone_netflix_app/widgets/background_header_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 2.1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BackgroundHeaderImage(),
          Positioned(
            bottom: 150,
              child: Column(
                children: [
                  Text(
                    'Unlimited movies,\n TV shows, and more.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600),),
                  SizedBox(height: 10,),
                  Text('Watch anywhere. Cancel anytime.', style: Theme.of(context).textTheme.headline6,textAlign: TextAlign.center,),
                  SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                      style: TextButton.styleFrom(
                          primary: Colors.black,
                          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                          backgroundColor: Colors.red),
                      child: Text('Get Started',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 28),)),

                ],
              ))
        ],
      ),);
  }
}
