import 'package:flutter/material.dart';

class CategorieContentList extends StatelessWidget {
  String category;
  double aspectRatio;
   CategorieContentList({required this.aspectRatio, required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(category, style: Theme.of(context).textTheme.headline6,),
          SizedBox(height: 10,),
          Expanded(child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index){
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AspectRatio(
                    aspectRatio:0.8,
                    child: Stack(
                      children: [
                        Container(color: Colors.amber,),
                        Container(decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.black.withOpacity(0.9), Colors.black.withOpacity(0.5)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter
                          ),
                        ),),
                      ],
                    ),),
                );
              }))
        ],
      ),
    );
  }
}
