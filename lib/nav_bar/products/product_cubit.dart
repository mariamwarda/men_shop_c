import'package:menshop/nav_bar/products/product-state.dart';
import 'package:menshop/features/productModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/networking/end_points.dart';


class product_cubit extends Cubit<ProductState> {
  product_cubit() : super(ProductInitial());

  Future<void> getProducts() async {
   try {
   emit(ProductLoading());

   final Response response =
   await DioHelper.getRequest(endPoint: AppEndPoints.allProducts);

   if (response.statusCode == 200) {
   final list = List<ProductModel>.from(
   (response.data as List).map((e) => ProductModel.fromJson(e)),
   );
   emit(ProductSuccess(list));
   } else {
   emit(ProductFailure());
   }
   } on DioException {
   emit(ProductFailure());
   } catch (_) {
   emit(ProductFailure());
   }
   }
}

