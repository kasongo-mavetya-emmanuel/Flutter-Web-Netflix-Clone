import 'package:clone_netflix_app/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: Responsive.isDesktop(context)? 5: Responsive.isTablet(context)? 4: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My List', style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
              itemBuilder: (_, index){
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Stack(
                  children: [
                    Container(color: Colors.amber,),
                    Positioned(
                      top: 10,
                        right: 10,
                        left: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.info_outline,
                                  )
                              ),
                             IconButton(icon:Icon(Icons.more_vert), onPressed: (){},)
                          ],
                        )),
                    Container(decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.black.withOpacity(0.9), Colors.black.withOpacity(0.5)],
                          begin: Alignment.bottomCenter,
                         end: Alignment.topCenter
                      ),
                    ),),
                    Positioned(
                      left: 0,
                        right: 0,
                        bottom: 0,
                        child: LinearProgressIndicator(value: 0.8,)),
                  ],
                ),),
            );
          }))
        ],
      ),
    );
  }
}
