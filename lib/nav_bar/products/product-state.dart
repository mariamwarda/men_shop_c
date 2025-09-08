import 'package:menshop/features/productModel.dart';
import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

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

class ProductFailure extends ProductState {}
