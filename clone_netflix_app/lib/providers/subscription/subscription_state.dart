
enum SubscriptionStatus{
  initial,
  subscribed,
  unsubscribed,
}

class SubscriptionState{
  SubscriptionStatus subscriptionStatus;

  SubscriptionState({
    required this.subscriptionStatus,
  });

  factory SubscriptionState.initial(){
    return SubscriptionState(subscriptionStatus: SubscriptionStatus.initial);
  }
//<editor-fold desc="Data Methods">

  @override
  String toString() {
    return 'SubscriptionState{' +
        ' subscriptionStatus: $subscriptionStatus,' +
        '}';
  }

  SubscriptionState copyWith({
    SubscriptionStatus? subscriptionStatus,
  }) {
    return SubscriptionState(
      subscriptionStatus: subscriptionStatus ?? this.subscriptionStatus,
    );
  }


//</editor-fold>
}