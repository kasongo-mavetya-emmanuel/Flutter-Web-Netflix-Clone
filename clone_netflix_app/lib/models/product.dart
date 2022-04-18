
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  double price= 0;
  String id;
  String currency;
  String period;

  ProductModel({
    required this.price,
    required this.id,
    required this.period,
    required this.currency,
  });
   factory ProductModel.initial(){
     return ProductModel(price: 0 , id: '', period: '',currency: 'Usd');
   }
  factory ProductModel.fromFirestore(DocumentSnapshot productDoc) {
    final productData= productDoc.data() as Map?;

    return ProductModel(
      price: productData!['unit_amount']/100,
      id: productDoc.id,
      period: productData['recurring']['interval'].toString(),
      currency:productData['currency'],
    );
  }


}