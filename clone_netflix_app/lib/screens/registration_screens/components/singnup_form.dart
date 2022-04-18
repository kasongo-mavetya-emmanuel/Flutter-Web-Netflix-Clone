import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/providers/signup/signup_state.dart';
import 'package:clone_netflix_app/providers/singin/sigin_state.dart';
import 'package:clone_netflix_app/screens/registration_screens/signin_screen.dart';
import 'package:clone_netflix_app/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../providers/signup/signup_provider.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController _passwordcontroller= TextEditingController();
  TextEditingController _emailcontroller= TextEditingController();
  TextEditingController _namecontroller= TextEditingController();


  final _formKey= GlobalKey<FormState>();

  void _submit()async{
    final form= _formKey.currentState;
    if(form==null || !form.validate())return;
    try{
      await context.read<SignupProvider>().signUp( _emailcontroller.text, _passwordcontroller.text);
    }on CustomError
    catch(e){
      errorDialog(context, e);
    }
  }
  @override
  Widget build(BuildContext context) {
    SignupState signUpState= context.watch<SignupProvider>().state;
    print('rrrrrrrrrrrrrrrrrrrrrrrrr${signUpState.signupStatus}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sign Up', style: Theme
                .of(context)
                .textTheme
                .headline2!
                .copyWith(fontWeight: FontWeight.w600),),
            SizedBox(height: 20,),
            EmailTextForm(),
            SizedBox(height: 20,),
            PasswordTextForm(),
            SizedBox(height: 20,),
            ConfirmPasswordTextForm(),
            SizedBox(height: 20,),
            Center(
              child: TextButton(
                  onPressed: signUpState.signupStatus==SignupStatus.submitting?null: _submit,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent[700],
                    padding:EdgeInsets.symmetric(vertical: 25,),
                  ),
                  child: Text(signUpState.signupStatus==SignupStatus.submitting?'Loading...' : 'Sign Up', style:Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w600),)),
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
              Text('Already Have An Account\?', style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.blueGrey, fontWeight: FontWeight.w100),),
              TextButton(
                onPressed:signUpState.signupStatus==SigninStatus.submitting?null: (){
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                  child: Text('Sign In', style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),)),

            ],)




          ],
        ),
      ),);
  }

  Widget NameTextForm(){

    return TextFormField(
      controller: _namecontroller,
      validator: (String? value){
        if(value!.isEmpty|| value.trim().isEmpty){
          return 'name required';
        }

      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          labelText: 'Name',
          labelStyle: TextStyle(color: Colors.blueGrey,
              fontSize: 14.0),
          fillColor: kdarkbgColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          hintText: 'Name',
          hintStyle: TextStyle(color: Colors.white)
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
        if(value.trim().length<6){
          return 'password need at least 6 character';
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

  Widget ConfirmPasswordTextForm(){
    return TextFormField(
      obscureText: true,
      style: TextStyle(color: Colors.white),
      validator: (String? value){
        if(_passwordcontroller.text!=value){
          return 'passwords are not match';
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

