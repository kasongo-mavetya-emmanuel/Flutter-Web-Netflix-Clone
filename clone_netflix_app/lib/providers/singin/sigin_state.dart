
import 'package:clone_netflix_app/models/custom_error.dart';

enum SigninStatus{
  initial,
  submitting,
  success,
  error,
}

class SigninState{
  SigninStatus signinStatus;
  CustomError? error;

//<editor-fold desc="Data Methods">

  SigninState({
    required this.signinStatus,
    this.error,
  });

  factory SigninState.initial(){
    return SigninState(signinStatus: SigninStatus.initial, error: CustomError());
  }

  @override
  String toString() {
    return 'SiginState{' +
        ' signinStatus: $signinStatus,' +
        ' error: $error,' +
        '}';
  }

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? error,
  }) {
    return SigninState(
      signinStatus: signinStatus ?? this.signinStatus,
      error: error ?? this.error,
    );
  }


//</editor-fold>
}