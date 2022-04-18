import 'package:clone_netflix_app/screens/registration_screens/components/singnup_form.dart';
import 'package:flutter/material.dart';

import '../../widgets/appBar.dart';
import '../../widgets/background_header_image.dart';
import '../welcome_screen/components/custom_footer.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName='/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
                  child: Container(
                    width: 500,
                    height: 700,
                    child: SignUpForm(),
                    decoration: BoxDecoration(
                      color: Colors.black54.withOpacity(0.8),
                    ),
                  )),

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
