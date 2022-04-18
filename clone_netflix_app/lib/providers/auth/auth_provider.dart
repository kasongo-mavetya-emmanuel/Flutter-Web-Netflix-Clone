
import 'package:clone_netflix_app/providers/auth/auth_state.dart';
import 'package:clone_netflix_app/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

class AuthProvider with ChangeNotifier{

  AuthState _state= AuthState.unknown();

  AuthState get state =>_state;

  final AuthRepository authRepository;

  AuthProvider({
    required this.authRepository,
  });

  void update(fbAuth.User? user){
    if(user!=null){
      _state=_state.copyWith(authStatus: AuthStatus.authenticated, user: user);
      notifyListeners();
    }
    else{
      _state=_state.copyWith(authStatus: AuthStatus.unauthenticated);
      notifyListeners();
    }

  }


}