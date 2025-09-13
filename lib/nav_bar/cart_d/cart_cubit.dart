import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/end_points.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/features/cart_model.dart';
import '../../features/productModel.dart';

part 'cart_state.dart';

class CartItemDetails {
  final String title;
  final String image;
  final double price;
  final int quantity;
  final double total;

  CartItemDetails({
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
  }) : total = price * quantity;
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartModel> userCart = [];
  List<ProductModel> allProducts = [];

  Future<void> getUserCart(int id) async {
    try {
      emit(CartLoading());
      final Response response = await DioHelper.getRequest(
        endPoint: "${AppEndPoints.getUserCart}$id",
      );

      if (response.statusCode == 200) {
        userCart = List<CartModel>.from(
          (response.data as List).map((e) => CartModel.fromJson(e)),
        );
        emit(CartSuccess(userCart));
      } else {
        emit(CartFailure("Unexpected error: ${response.statusCode}"));
      }
    } catch (e) {
      emit(CartFailure(e.toString()));
    }
  }

  void setProducts(List<ProductModel> products) {
    allProducts = products;
  }

  List<CartItemDetails> getCartDetails() {
    if (userCart.isEmpty || allProducts.isEmpty) return [];

    final cartItems = <CartItemDetails>[];
    for (final cart in userCart) {
      for (final p in cart.products!) {
        final product = allProducts.firstWhere(
              (prod) => prod.id == p.productId,
          orElse: () => ProductModel(), // fallback لو المنتج مش موجود
        );
        cartItems.add(CartItemDetails(
          title: product.title ?? "Unknown",
          image: product.image ?? "",
          price: (product.price ?? 0).toDouble(),
          quantity: (p.quantity ?? 0).toInt(),
        ));
      }
    }
    return cartItems;
  }

  addToCart() async {
    try {
      emit(AddToCartLoading());
      final Response response = await DioHelper.postRequest(
        endPoint: AppEndPoints.addToCart, data: {},
      );
      if (response.statusCode == 201) {
        emit(AddToCartSuccess());
      } else {
        emit(AddToCartFailure("Can not add to cart"));
      }
    } on DioException catch (e) {
      emit(AddToCartFailure(e.response?.data ?? e.toString()));
    } catch (e) {
      emit(AddToCartFailure(e.toString()));
    }
  }
}
