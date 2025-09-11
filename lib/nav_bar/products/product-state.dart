import 'package:menshop/features/productModel.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> model;

  const ProductSuccess(this.model);

  @override
  List<Object?> get props => [model];
}

class ProductFailure extends ProductState {
  final String error;

  const ProductFailure(this.error);

  @override
  List<Object?> get props => [error];
}
