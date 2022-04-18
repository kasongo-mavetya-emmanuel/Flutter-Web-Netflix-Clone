import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Questions? Contact us.', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //first
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('FAQ', style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Investor Relations', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Privacy', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Speed Test', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey))
              ],),
            //second
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Help Center', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Jobs', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Cookie Preferences', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Legal Notices', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey))
              ],),

            //third
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Account', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Ways to Watch', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Corporate Information', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Only on Netflix', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey))
              ],
            ),
            //fourth
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Media Center', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Terms of Use', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey)),
                SizedBox(height: 10,),
                Text('Contact Us', style: Theme.of(context).textTheme.bodyText1!.copyWith(color:  Colors.blueGrey))

              ],
            )
          ],
        )
      ],
    );
  }
}
