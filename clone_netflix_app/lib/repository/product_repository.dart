


import 'package:clone_netflix_app/constants.dart';
import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository{

  Future<List<ProductModel>> getProducts()async{
   try{
     QuerySnapshot snapshot=  await productRef.get();
     List<ProductModel> products=[];
     for (var product in snapshot.docs){
         QuerySnapshot snap= await productRef.doc(product.id).collection('prices').where('active',isEqualTo: true).get();
            for (var price in snap.docs) {
             products.add( ProductModel.fromFirestore(price));
             print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz${products}');
            }
       }

     print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz${products}');
     return products;

   }on FirebaseException catch(e){
     throw CustomError(code: e.code, message: e.message!, plugin: e.plugin);
   }catch(e){
     throw CustomError(code: 'Exception', message: e.toString(), plugin: 'flutter_error/server/error');
   }
  }
}



