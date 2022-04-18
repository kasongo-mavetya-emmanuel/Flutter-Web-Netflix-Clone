import 'package:clone_netflix_app/models/custom_error.dart';

enum PaySubscriptionStatus{
  initial,
  submiting,
  success,
  error,
}

class PaySubscriptionState{

  PaySubscriptionStatus paySubscriptionStatus;
  CustomError? error;

//<editor-fold desc="Data Methods">


  PaySubscriptionState({
    required this.paySubscriptionStatus,
    this.error,
  });

  factory PaySubscriptionState.initial(){
    return PaySubscriptionState(paySubscriptionStatus: PaySubscriptionStatus.initial);
  }


  @override
  String toString() {
    return 'CreateSubscriptionState{' +
        ' createSubscriptionStatus: $paySubscriptionStatus,' +
        ' error: $error,' +
        '}';
  }

  PaySubscriptionState copyWith({
    PaySubscriptionStatus? paySubscriptionStatus,
    CustomError? error,
  }) {
    return PaySubscriptionState(
      paySubscriptionStatus:
          paySubscriptionStatus ?? this.paySubscriptionStatus,
      error: error ?? this.error,
    );
  }


//</editor-fold>
}