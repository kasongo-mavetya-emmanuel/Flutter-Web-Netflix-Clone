import 'package:clone_netflix_app/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: _MobileAppBar(),
        tablet: _MobileAppBar(),
        desktop: _DesktopAppBar());
  }
}

class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('N',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600),),
        Expanded(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarTextButton( text: 'Home',),
                AppBarTextButton( text: 'TV Shows',),
                AppBarTextButton( text: 'Movies',),
                AppBarTextButton( text: 'My List',),
              ],
            )),

      ],
    );
  }
}


class _DesktopAppBar extends StatelessWidget {
  const _DesktopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('NetFlix',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600),),
        Expanded(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppBarTextButton( text: 'Home',),
                AppBarTextButton( text: 'TV Shows',),
                AppBarTextButton( text: 'Movies',),
                AppBarTextButton( text: 'Latest',),
                AppBarTextButton( text: 'My List',),
              ],
            )),
        Spacer(),
        Expanded(child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(icon: Icons.search,),
            AppBarTextButton( text: 'KIDS',),
            AppBarTextButton( text: 'DVD',),
            IconButton(icon: Icons.card_giftcard),
            IconButton(icon: Icons.notifications),
          ],
        ),)
      ],
    );
  }
}


class IconButton extends StatelessWidget {
  IconData icon;
   IconButton({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}

class AppBarTextButton extends StatelessWidget {
  String text;
  AppBarTextButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline6);
  }
}
