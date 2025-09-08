import  'package:menshop/features/productModel.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductSuccess extends ProductState {
  List<ProductModel>model;
  ProductSuccess(this.model);
}
class ProductFailure extends ProductState {}


