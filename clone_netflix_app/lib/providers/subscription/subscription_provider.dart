
import 'package:clone_netflix_app/providers/subscription/subscription_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionProvider with ChangeNotifier{

  SubscriptionState _state= SubscriptionState.initial();
   get state=>_state;

  //
  // SubscriptionProvider({this.snapshot}){
  //   update();
  // }

  void update(QuerySnapshot? snapshot){
    if(snapshot==null){
      print('KKKKKKKKKKKKKKKKKKKKKKKKK${snapshot}');
      print('KKKKKKKKKKKKKKKKKKKKKKKKK${state}');
      print('KKKKKKKKKKKKKKKKKKKKKKKKK${_state}');


      _state=_state.copyWith(subscriptionStatus: SubscriptionStatus.initial);
    }
    else{

      if(snapshot.docs.length !=0){
        _state=_state.copyWith(subscriptionStatus: SubscriptionStatus.subscribed);
        notifyListeners();
      }
      else{
        _state=_state.copyWith(subscriptionStatus: SubscriptionStatus.unsubscribed);
      }

    }

  }
}