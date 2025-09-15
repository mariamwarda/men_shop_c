import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/networking/end_points.dart';
import 'package:menshop/login/state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  Future<void> login() async {
    if (nameController.text.isEmpty || passwordController.text.isEmpty) {
      emit(LoginFailure("Please enter username and password"));
      return;
    }

    try {
      emit(LoginLoading());

      final Response response = await DioHelper.postRequest(
        endPoint: AppEndPoints.login,
        data: {
          "username": nameController.text.trim(),
          "password": passwordController.text.trim(),
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        if (data != null && data is Map<String, dynamic>) {
          emit(LoginSuccess(data as String));
        } else {
          emit(LoginFailure("Invalid response format from server"));
        }
      } else {
        emit(LoginFailure("Unexpected error: ${response.statusCode}"));
      }

    } on DioException catch (e) {
      final errorMsg = e.response?.data is String
          ? e.response?.data
          : e.response?.statusMessage ?? e.message ?? "Network error";
      emit(LoginFailure(errorMsg.toString()));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
