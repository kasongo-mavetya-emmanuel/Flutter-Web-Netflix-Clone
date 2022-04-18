import 'package:clone_netflix_app/constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class FrequentlyAskedQuestions extends StatelessWidget {
  const FrequentlyAskedQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Frequently Asked Questions',style: Theme.of(context).textTheme.headline2!.copyWith(fontWeight: FontWeight.w600) ,),
             SizedBox(height: 15,),
             ExpandableQuestion(collapsedText: 'What\'s NetFlix',expandedText: 'Netflix is a streaming service that offers a wide variety of award-winning TV shows, movies, anime, documentaries, and more on thousands of internet-connected devices.You can watch as much as you want, whenever you want without a single commercial all for one low monthly price. There\'s always something new to discover and new TV shows and movies are added every week!',),
            ExpandableQuestion(collapsedText: 'How much does NetFlix Cost', expandedText: "Watch Netflix on your smartphone, tablet, Smart TV, laptop, or streaming device, all for one fixed monthly fee. Plans range from US\$3.99 to US\$11.99 a month. No extra costs, no contracts."),
            ExpandableQuestion(collapsedText: 'Where Can I watch', expandedText: 'Watch anywhere, anytime. Sign in with your Netflix account to watch instantly on the web at netflix.com from your personal computer or on any internet-connected device that offers the Netflix app, including smart TVs, smartphones, tablets, streaming media players and game consoles.You can also download your favorite shows with the iOS, Android, or Windows 10 app. Use downloads to watch while you\'re on the go and without an internet connection. Take Netflix with you anywhere.'),
            ExpandableQuestion(collapsedText: 'How do I cancel', expandedText:'Netflix is flexible. There are no pesky contracts and no commitments. You can easily cancel your account online in two clicks. There are no cancellation fees – start or stop your account anytime.')
          ],),
      ),
    );
  }
}

class ExpandableQuestion extends StatelessWidget {
  String collapsedText;
  String expandedText;
   ExpandableQuestion({
     required this.collapsedText,
     required this.expandedText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ExpandableTheme(
      data:ExpandableThemeData(
            expandIcon: Icons.add,
            collapseIcon: Icons.clear,
            iconColor: Colors.white,
            iconSize: 28.0,
            iconRotationAngle: math.pi / 2,
            iconPadding: EdgeInsets.only(right: 5),
            hasIcon: true,
          ),
      child: ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: kdarkbgColor,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[

                  ScrollOnExpand(
                    scrollOnExpand: true,
                    scrollOnCollapse: false,
                    child: ExpandablePanel(
                      theme: const ExpandableThemeData(
                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                        tapBodyToCollapse: true,
                      ),
                      header: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            collapsedText,
                            style: Theme.of(context).textTheme.headline6,
                          )),
                      collapsed: Container(), //Text(''
                        // collapsedText,
                        // softWrap: true,
                        // maxLines: 2,
                        // overflow: TextOverflow.ellipsis,
                     // ),
                      expanded:Text(expandedText, style: Theme.of(context).textTheme.headline6, softWrap: true, ),
                      builder: (_, collapsed, expanded) {
                        return Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Expandable(
                            collapsed: collapsed,
                            expanded: expanded,
                            theme: const ExpandableThemeData(crossFadePoint: 0,),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
