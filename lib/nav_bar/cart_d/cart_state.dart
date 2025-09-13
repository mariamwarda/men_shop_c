part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartSuccess extends CartState {
  List<CartModel>model;
  CartSuccess(this.model);
}
class CartFailure extends CartState {
  final String errMsg;
  CartFailure(this.errMsg);
}



class AddToCartLoading extends CartState {}
class AddToCartSuccess extends CartState {
}
class AddToCartFailure extends CartState {
  final String errMsg;
  AddToCartFailure(this.errMsg);
}