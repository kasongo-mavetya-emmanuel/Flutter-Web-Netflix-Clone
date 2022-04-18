
import 'package:clone_netflix_app/models/custom_error.dart';
import 'package:clone_netflix_app/models/product.dart';

enum ProductStatus{
  initial,
  loading,
  loaded,
  error,
}

class ProductState{
  ProductStatus productStatus;
  List<ProductModel> Products;
  CustomError? error;

//<editor-fold desc="Data Methods">

  ProductState({
    required this.productStatus,
    required this.Products,
     this.error,
  });

  factory ProductState.initial(){
    return ProductState(productStatus: ProductStatus.initial, Products: [ProductModel.initial()], error: CustomError());
  }


  @override
  String toString() {
    return 'ProductState{' +
        ' productStatus: $productStatus,' +
        ' Products: $Products,' +
        ' error: $error,' +
        '}';
  }

  ProductState copyWith({
    ProductStatus? productStatus,
    List<ProductModel>? Products,
    CustomError? error,
  }) {
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      Products: Products ?? this.Products,
      error: error ?? this.error,
    );
  }



//</editor-fold>
}