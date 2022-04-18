import 'package:clone_netflix_app/responsive.dart';
import 'package:clone_netflix_app/screens/home_screen/home_screen.dart';
import 'package:clone_netflix_app/screens/landing_screen/components/customized_app_bar.dart';
import 'package:clone_netflix_app/screens/search_screen/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget
{
  static const String routeName='/landing';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  List<Widget> pages=[
    HomePage(),
    SearchScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  int _currentIndex=0;

  void onTap(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
        Size( MediaQuery.of(context).size.width, 80),
      child: CustomizedAppBar()),
      body: pages[_currentIndex],
         bottomNavigationBar: !Responsive.isDesktop(context)? BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white60,
        selectedItemColor: Colors.white,
        showSelectedLabels: true,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Search',
              icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: 'Coming Soon',
              icon: Icon(Icons.upcoming)),
          BottomNavigationBarItem(
              label: 'Download',
              icon: Icon(Icons.download_rounded)),
          BottomNavigationBarItem(
              label: 'More',
              icon: Icon(Icons.menu)),
        ],
      ): null,

    );
  }
}
