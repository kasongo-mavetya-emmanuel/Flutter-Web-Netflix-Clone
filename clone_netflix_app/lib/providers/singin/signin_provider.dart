

import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/providers/singin/sigin_state.dart';
import 'package:clone_netflix_app/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';

class SigninProvider with ChangeNotifier{
  SigninState _state= SigninState.initial();
  SigninState get state=> _state;
  final AuthRepository authRepository;

   SigninProvider({
    required this.authRepository,
  });

 Future<void> signIn(String email, String password)async {
   _state=_state.copyWith(signinStatus: SigninStatus.submitting,);
   notifyListeners();
   try{
     await authRepository.signIn(email, password);

     _state=_state.copyWith(signinStatus: SigninStatus.success);
     notifyListeners();

   }on CustomError catch(e){
     _state=_state.copyWith(signinStatus: SigninStatus.error, error: e);
   }
 }
}