import 'package:clone_netflix_app/models/custom_error.dart';

enum SignupStatus{
  initial,
  submitting,
  success,
  error,
}

class SignupState{
  SignupStatus signupStatus;
  CustomError? error;

  factory SignupState.initial(){
    return SignupState(signupStatus: SignupStatus.initial, error: CustomError());
  }

//<editor-fold desc="Data Methods">

  SignupState({
    required this.signupStatus,
    this.error,
  });

  @override
  String toString() {
    return 'SignupState{' +
        ' signupStatus: $signupStatus,' +
        ' error: $error,' +
        '}';
  }

  SignupState copyWith({
    SignupStatus? signupStatus,
    CustomError? error,
  }) {
    return SignupState(
      signupStatus: signupStatus ?? this.signupStatus,
      error: error ?? this.error,
    );
  }


//</editor-fold>
}