import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/networking/end_points.dart';
import 'package:menshop/signup/signup_state.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  void toggleEye() {
    obscureText = !obscureText;
    emit(SignUpTogglePassword(obscureText));
  }

  Future<void> signUp() async {
    try {
      emit(SignUpLoading());

      final Response response = await DioHelper.postRequest(
        endPoint: AppEndPoints.signup,
        data: {
          "username": nameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SignUpSuccess(response.data));
      } else {
        emit(SignUpFailure("Unexpected error: ${response.statusCode}"));
      }
    } on DioException catch (e) {
      emit(SignUpFailure(e.response?.data?.toString() ?? e.message ?? "Error"));
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}
