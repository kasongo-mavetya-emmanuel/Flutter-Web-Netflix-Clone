import 'package:cloud_firestore/cloud_firestore.dart';


class User {
  String id;
  String name;
  String email;
  String profileUrl;
  User({required this.id, required this.name, required this.email, required this.profileUrl});


  factory User.initialUser(){
    return User(id: '', name: '', email: '', profileUrl: '');
  }

  factory User.fromDoc(DocumentSnapshot userDoc){
    final userData= userDoc.data() as Map<String, dynamic>?;
    return User(
        id: userDoc.id, name: userData!['name'], email: userData['email'], profileUrl: userData['profileUrl']);

  }


}