import 'package:clone_netflix_app/assets.dart';
import 'package:flutter/material.dart';

class CustomizedAppBar extends StatelessWidget {
  const CustomizedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(Assets.netflixLogo1,),
          TextButton(onPressed: (){},
              style: TextButton.styleFrom(
              primary: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              backgroundColor: Colors.redAccent[700]),
              child: Text('Signin') ),

        ],
      ),
    );
  }
}
