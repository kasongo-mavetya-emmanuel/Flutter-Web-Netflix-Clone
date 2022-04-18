import 'package:clone_netflix_app/screens/home_screen/components/categorie_list.dart';
import 'package:clone_netflix_app/screens/home_screen/components/content_header.dart';
import 'package:clone_netflix_app/screens/home_screen/components/my_list.dart';
import 'package:flutter/material.dart';
import '../../responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: MyList(),),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child: CategorieContentList(
                aspectRatio: Responsive.isDesktop(context)? 5 : Responsive.isTablet(context)?4:2 , category: 'Animated',),),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverToBoxAdapter(
              child:  CategorieContentList(aspectRatio: Responsive.isDesktop(context)? 4 : Responsive.isTablet(context)? 3:1.4 , category: 'Orignals',),),
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: 10.0))
        ],),
    );
  }
}
