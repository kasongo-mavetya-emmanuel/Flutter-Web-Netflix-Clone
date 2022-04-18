import 'package:clone_netflix_app/firebase_options.dart';
import 'package:clone_netflix_app/providers/auth/auth_provider.dart';
import 'package:clone_netflix_app/providers/products/product_provider.dart';
import 'package:clone_netflix_app/providers/signup/signup_provider.dart';
import 'package:clone_netflix_app/providers/singin/signin_provider.dart';
import 'package:clone_netflix_app/providers/subscription/pay_subscription_provider.dart';
import 'package:clone_netflix_app/providers/subscription/subscription_provider.dart';
import 'package:clone_netflix_app/repository/auth_repository.dart';
import 'package:clone_netflix_app/repository/product_repository.dart';
import 'package:clone_netflix_app/repository/subscription_repository.dart';
import 'package:clone_netflix_app/screens/home_screen/home_screen.dart';
import 'package:clone_netflix_app/screens/payment_screen/payment_screen.dart';
import 'package:clone_netflix_app/screens/registration_screens/signin_screen.dart';
import 'package:clone_netflix_app/screens/registration_screens/signup_screen.dart';
import 'package:clone_netflix_app/screens/welcome_screen/welcome_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'as fbAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(create:(context)=> AuthRepository( auth: fbAuth.FirebaseAuth.instance, )),
        Provider<ProductRepository>(create:(context)=> ProductRepository()),
        StreamProvider<fbAuth.User?>(create:(context)=> context.read<AuthRepository>().user, initialData: null),
        Provider<SubscriptionRepository>(create:(context)=> SubscriptionRepository(user: context.read<fbAuth.User?>())),
        StreamProvider<QuerySnapshot?>(create:(context)=> context.read<SubscriptionRepository>().isSubscribed, initialData: null ),
        ChangeNotifierProxyProvider<fbAuth.User?, AuthProvider>(create: (context)=> AuthProvider(authRepository: context.read<AuthRepository>()),
            update: (BuildContext context, fbAuth.User? userStream, AuthProvider? authProvider)=>authProvider!..update(userStream)),
        ChangeNotifierProvider<SigninProvider>(create: (context)=> SigninProvider(authRepository: context.read<AuthRepository>())),
        ChangeNotifierProvider<SignupProvider>(create: (context)=> SignupProvider(authRepository: context.read<AuthRepository>())),
        ChangeNotifierProxyProvider<QuerySnapshot?, SubscriptionProvider>(
          create: (context)=>SubscriptionProvider(),
            update: (_, QuerySnapshot? querySnapshotStream, SubscriptionProvider? subscriptionProvider)=> subscriptionProvider!..update(querySnapshotStream)),
        ChangeNotifierProvider<ProductProvider>(create: (context)=> ProductProvider(productRepository: context.read<ProductRepository>())),
        ChangeNotifierProvider<PaySubscriptionProvider>(create: (context)=> PaySubscriptionProvider(subscriptionRepository: context.read<SubscriptionRepository>())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          textTheme: TextTheme(
            headline2: TextStyle(color: Colors.white),
            headline3: TextStyle(color: Colors.white),
            headline6: TextStyle(color: Colors.white),
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white),

          ),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        canvasColor: Colors.black,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black,
        ),
        initialRoute: WelcomeScreen.routeName,
        routes: {
          HomePage.routeName:(context)=> HomePage(),
          WelcomeScreen.routeName: (context) => WelcomeScreen(),
          SignInScreen.routeName: (context)=> SignInScreen(),
          SignUpScreen.routeName:(context)=> SignUpScreen(),
          PaymentScreen.routeName:(context)=> PaymentScreen(),

        },
      ),
    );
  }
}

