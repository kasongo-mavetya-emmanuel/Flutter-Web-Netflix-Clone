

import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/models/product.dart';
import 'package:clone_netflix_app/providers/products/product_state.dart';
import 'package:clone_netflix_app/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier{
  ProductState _state= ProductState.initial();
  ProductState get state=>_state;

  final ProductRepository productRepository;

  ProductProvider({
    required this.productRepository,
  }){
    getProduct();
    ;}


  Future<void> getProduct() async{
    _state=_state.copyWith(productStatus: ProductStatus.loading);
    notifyListeners();
    try{
      _state=_state.copyWith(productStatus: ProductStatus.loaded, Products: await productRepository.getProducts());
      notifyListeners();
      print('tttttttttttttttttttttttttttttttttttttttg${state}');


    }on CustomError catch(e){
      _state=_state.copyWith(productStatus: ProductStatus.error, error: e);
      rethrow;
  }
}

}