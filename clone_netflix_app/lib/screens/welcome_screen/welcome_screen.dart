import 'package:clone_netflix_app/constants.dart';
import 'package:clone_netflix_app/providers/auth/auth_provider.dart';
import 'package:clone_netflix_app/screens/payment_screen/payment_screen.dart';
import 'package:clone_netflix_app/screens/welcome_screen/components/frequently_asked_questions.dart';
import 'package:clone_netflix_app/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth/auth_state.dart';
import '../welcome_screen/components/content_header.dart';
import 'components/custom_footer.dart';
import 'components/watch_on_mobile.dart';
import 'components/watch_on_tv.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName='/welcome';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final autState= context.watch<AuthProvider>().state;


    if(autState.authStatus== AuthStatus.authenticated){
      print('azzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz${autState.authStatus}');
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushNamed(context, PaymentScreen.routeName);
      });

    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(preferredSize: Size( MediaQuery.of(context).size.width, 50),child: CustomizedAppBar(),),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ContentHeader(),),
          SliverToBoxAdapter(child: Divider(thickness:8,color: kdarkbgColor),),
          SliverToBoxAdapter(child: WatchOnTv(),),
          SliverToBoxAdapter(child: Divider(thickness:8,color:kdarkbgColor),),
          SliverToBoxAdapter(child: WatchOnMobile(),),
          SliverToBoxAdapter(child: Divider(thickness:8,color:kdarkbgColor),),
          SliverToBoxAdapter(child: FrequentlyAskedQuestions(),),
          SliverToBoxAdapter(child: Divider(thickness:8,color: kdarkbgColor),),
          SliverToBoxAdapter(child: CustomFooter(),),

        ],
      ),
    );
  }
}
