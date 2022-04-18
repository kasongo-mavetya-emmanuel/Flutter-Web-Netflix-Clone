

import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/providers/signup/signup_state.dart';
import 'package:clone_netflix_app/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class SignupProvider with ChangeNotifier{
  SignupState _state= SignupState.initial();
  SignupState get state=> _state;
  final AuthRepository authRepository;

  SignupProvider({
    required this.authRepository,
  });

  Future<void> signUp( String email, String password)async {
   _state=_state.copyWith(signupStatus: SignupStatus.submitting,);
    notifyListeners();
    try{
      await authRepository.signUp(email, password);

      _state=_state.copyWith(signupStatus: SignupStatus.success);
      notifyListeners();

    }on CustomError catch(e){
      _state=_state.copyWith(signupStatus: SignupStatus.error, error: e);
    }
  }
}