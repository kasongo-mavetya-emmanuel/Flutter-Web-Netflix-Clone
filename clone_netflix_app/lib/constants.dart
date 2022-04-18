
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

const kdarkbgColor= Color(0xFF242430);

 CollectionReference usersRef= FirebaseFirestore.instance.collection('users');
CollectionReference productRef= FirebaseFirestore.instance.collection('products');