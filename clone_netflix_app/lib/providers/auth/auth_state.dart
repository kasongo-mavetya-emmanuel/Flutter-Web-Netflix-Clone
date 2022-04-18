import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:flutter/material.dart';

enum AuthStatus{
  unknown,
  authenticated,
  unauthenticated,
}



class AuthState {

  final fbAuth.User? user;
  final AuthStatus authStatus;


  factory AuthState.unknown(){
    return AuthState(authStatus: AuthStatus.unknown);
  }

//<editor-fold desc="Data Methods">

  const AuthState({
    this.user,
    required this.authStatus,
  });

  @override
  String toString() {
    return 'AuthState{' + ' user: $user,' + ' authStatus: $authStatus,' + '}';
  }

  AuthState copyWith({
    fbAuth.User? user,
    AuthStatus? authStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
    );
  }



//</editor-fold>
}

