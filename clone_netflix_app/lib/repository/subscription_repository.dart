

import 'dart:html';

import 'package:clone_netflix_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;


import '../models/custom_error.dart';

class SubscriptionRepository{
  // final FirebaseFirestore firebaseFirestore;
    fbAuth.User? user;
  SubscriptionRepository({required this.user});

  Stream<QuerySnapshot?>? get isSubscribed {

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

       print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${user!.uid}');
       final subRef=usersRef.doc(user!.uid).collection('subscriptions');
       if(subRef==null ){
         print('aannnnnnnnnnnnnnnnnnnnnnnnnnnn${user!.uid}');

         return null;
       }
    print('ajhhhhhhhhhhhhhhhhhhhhhhhhhhh${user!.uid}');
    return subRef.where('status', isEqualTo: 'active').snapshots();


  }


  Future<void> paySubscription(String priceId)async{
    try{
       await usersRef.doc(user!.uid).collection('checkout_sessions')
           .add({
         'price': priceId,
         'success_url': window.location.origin,
         'cancel_url': window.location.origin,
       }).then((value)async{
         await value.snapshots().listen((event) {
           print('ooooooooooooooooooooooo${event.get('url')}');

            window.location.assign(event.get('url'));


           //print('ooooooooooooooooooooooo${event.data()}');

         });





       });


       // await usersRef.doc(user!.uid).collection('checkout_sessions').snapshots().listen((event) {
       //   print('uuuuuuuuuuuuuuuuuuuuuuuuuu${event}');
       //   event.docChanges.forEach((element) {
       //     print('pppppppppppppppppppppppppppppppppppp${element.doc.data()}');
       //     window.location.assign(element.doc.data()!['url']);
       //   });
       // });




    }on FirebaseException catch(e){
      throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
    }catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'flutter_error/server/error');
    }
  }


}