

import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/providers/subscription/pay_subscription_state.dart';
import 'package:clone_netflix_app/repository/subscription_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter/cupertino.dart';

class PaySubscriptionProvider with ChangeNotifier{
  PaySubscriptionState _state= PaySubscriptionState.initial();
   PaySubscriptionState get state=> _state;
  final SubscriptionRepository subscriptionRepository;
  PaySubscriptionProvider({
    required this.subscriptionRepository,
  });

  paySubscription(String priceId) async{
    try{
      _state=_state.copyWith(paySubscriptionStatus: PaySubscriptionStatus.submiting);
      notifyListeners();
      await subscriptionRepository.paySubscription(priceId);

      _state=_state.copyWith(paySubscriptionStatus: PaySubscriptionStatus.success);
      notifyListeners();



    }on CustomError catch(e){
         _state=_state.copyWith(paySubscriptionStatus: PaySubscriptionStatus.error, error: e);
         rethrow;
    }
  }


}