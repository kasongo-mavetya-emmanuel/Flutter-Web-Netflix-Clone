import 'package:clone_netflix_app/constants.dart';
import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;


class AuthRepository{
  //FirebaseFirestore firestore;
  fbAuth.FirebaseAuth auth;
  AuthRepository({ required this.auth});

  Stream<fbAuth.User?> get user=> auth.userChanges();

  Future<void> signUp( String email, String password)async{
    try{
      //fbAuth.UserCredential userCredentials=
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      // final signInUser= userCredentials.user!;
      // await usersRef.doc(signInUser.uid).set({
      //   'email':signInUser.email,
      // });

    }on fbAuth.FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    }catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'flutter_error/server/error');
    }
  }

  Future<void> signIn(String email, String password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }on fbAuth.FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    }catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'flutter_error/server/error');
    }
  }

  Future<void> signOut(String email, String password)async{
    await auth.signOut();
  }


}