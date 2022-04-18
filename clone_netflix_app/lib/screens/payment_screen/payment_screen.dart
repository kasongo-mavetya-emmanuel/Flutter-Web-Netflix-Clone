
import 'package:clone_netflix_app/providers/subscription/subscription_provider.dart';
import 'package:clone_netflix_app/providers/subscription/subscription_state.dart';
import 'package:clone_netflix_app/screens/home_screen/home_screen.dart';
import 'package:clone_netflix_app/screens/payment_screen/components/custom_footer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/appBar.dart';
import '../../widgets/background_header_image.dart';
import '../landing_screen/landing_screen.dart';
import 'components/payment_plans.dart';

class PaymentScreen extends StatefulWidget {
  static const String routeName='/payment';
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }





  @override
  Widget build(BuildContext context) {
    final  subscription= context.watch<SubscriptionProvider>().state;


    print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbb${subscription.subscriptionStatus}');

    if(subscription.subscriptionStatus== SubscriptionStatus.subscribed){
      print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbb${subscription.subscriptionStatus}');
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushNamed(context,  LandingScreen.routeName);
      });

    }


    return
      Scaffold(
      appBar: PreferredSize(preferredSize: Size( MediaQuery.of(context).size.width, 50),child: CustomizedAppBar(),),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          child: Stack(
            alignment: Alignment.center,
            //fit: StackFit.expand,
            children: [
              BackgroundHeaderImage(),
              Positioned(
                  top: 100,
                  child: PaymentPlans(),
              ),

              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child:
                  Container(
                    height: 150,
                    child: CustomFooter(),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),

                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }


}
