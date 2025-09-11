import 'package:menshop/nav_bar/products/product-state.dart';
import 'package:menshop/features/productModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/networking/end_points.dart';

class ProductCubit extends Cubit<ProductState> {
 ProductCubit() : super(ProductInitial());

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
    emit(ProductFailure("Unexpected error: ${response.statusCode}"));
   }
  } on DioException catch (e) {
   emit(ProductFailure(e.message ?? "Dio error"));
  } catch (e) {
   emit(ProductFailure(e.toString()));
  }
 }
}
