import 'package:clone_netflix_app/responsive.dart';
import 'package:flutter/material.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(desktop: _DesktopContentHeader(), mobile: _MobileContentHeader(),);
  }
}

class _DesktopContentHeader extends StatelessWidget {
  const _DesktopContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: Stack(
        children: [
          Container(color: Colors.redAccent,),//TODO: replace with image
          Container(decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter),
          ),),
          Positioned(
              bottom: 100,
              left: 60,
              right: 60,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SINTEL',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox( height:20),
                  SizedBox(
                    width: 450,
                    child: Text('this is the story about a little gild sko f fdtj g kdgjdreogv fjdgjteggf fmdj djgetogddgohhf fdjdriiwrieiteiitetv fidigdwi sfd  fiwr',
                      style: TextStyle(
                          shadows: [Shadow(
                              color:Colors.black,
                              offset: Offset(2.0, 4.0)
                          )]
                      ),),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      TextButtonIcon(label: 'Play', icon: Icons.play_arrow_rounded,),
                      SizedBox(width: 20,),
                      TextButtonIcon(label: 'More Info', icon: Icons.info_outline,),
                      SizedBox(width: 10,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.volume_up)),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}


class _MobileContentHeader extends StatelessWidget {
  const _MobileContentHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio:  Responsive.isTablet(context)?1.6: 1.1,
      child: Stack(
        alignment: Alignment.center,
        children: [
           Container(color: Colors.redAccent,),//TODO: replace with image
          Container(decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black,Colors.transparent],begin: Alignment.bottomCenter,end: Alignment.topCenter),
          ),),
          Positioned(
              bottom: 100,
              child:Column(
                children: [
                  Text(
                    'SINTEL',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox( height:20),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                      SizedBox(width: 10,),
                      TextButtonIcon(label: 'Play', icon: Icons.play_arrow_rounded,),
                      SizedBox(width: 10,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.info)),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}



class TextButtonIcon extends StatelessWidget {
  IconData icon;
  String label;
   TextButtonIcon({
    required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
       style: TextButton.styleFrom(
         primary: Colors.black,
         padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
           backgroundColor: Colors.white),
        onPressed: (){}, icon: Icon(icon), label: Text(label));
  }
}
