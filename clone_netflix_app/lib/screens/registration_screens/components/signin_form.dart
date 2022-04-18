import 'package:clone_netflix_app/constants.dart';
import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/providers/singin/sigin_state.dart';
import 'package:clone_netflix_app/screens/registration_screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/singin/signin_provider.dart';
import '../../../utils/error_dialog.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController _passwordcontroller= TextEditingController();
  TextEditingController _emailcontroller= TextEditingController();

  final _formKey= GlobalKey<FormState>();

  void _submit()async{
    final form= _formKey.currentState;
    if(form==null || !form.validate())return;
    try{
      await context.read<SigninProvider>().signIn(_emailcontroller.text, _passwordcontroller.text);

    }on CustomError catch(e){
      errorDialog(context, e);
    }  }

  @override
  Widget build(BuildContext context) {
    final signinState= context.watch<SigninProvider>().state;
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${signinState.signinStatus}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text('Sign In', style: Theme
            .of(context)
            .textTheme
            .headline2!
            .copyWith(fontWeight: FontWeight.w600),),
        SizedBox(height: 20,),
        EmailTextForm(),
        SizedBox(height: 20,),
        PasswordTextForm(),
            SizedBox(height: 20,),
            Center(
              child: TextButton(
                  onPressed: signinState.signinStatus==SigninStatus.submitting?null: _submit,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent[700],
                    padding:EdgeInsets.symmetric(vertical: 25,),
                  ),
                  child: Text(signinState.signinStatus==SigninStatus.submitting?'Loading...' : 'Sign In', style:Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),)),
            ),
            SizedBox(height: 5,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Text('Need Help\?', style:TextStyle(color: Colors.blueGrey),),

              ],
            ),

            SizedBox(height: 50,),


            Row(children: [
              Text('New to Netflix\?', style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blueGrey, fontWeight: FontWeight.w100),),
              TextButton(onPressed:signinState.signinStatus==SigninStatus.submitting?null: (){
                Navigator.pushNamed(context, SignUpScreen.routeName);
              },
                  child: Text('Sign Up Now', style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),)),

            ],)




          ],
    ),
      ),);
  }

  Widget PasswordTextForm(){
    return TextFormField(
      controller: _passwordcontroller,
      obscureText: true,
      style: TextStyle(color: Colors.white),
      validator: (String? value){
        if(value!.isEmpty|| value.trim().isEmpty){
          return 'password required';
        }
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.blueGrey,
              fontSize: 14.0),
          fillColor: kdarkbgColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white)
      ),);

  }

  Widget EmailTextForm(){

    return TextFormField(
      controller: _emailcontroller,
      validator: (String? value){
        if(value!.isEmpty|| value.trim().isEmpty){
          return 'email required';
        }
        if(!value.contains('@')){
          return 'invalid email';
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          labelText: 'Email',
          labelStyle: TextStyle(color: Colors.blueGrey,
              fontSize: 14.0),
          fillColor: kdarkbgColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          hintText: 'Email',
          hintStyle: TextStyle(color: Colors.white)
      ),);
  }
}



