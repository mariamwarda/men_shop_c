import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:menshop/networking/dio-h.dart';
import 'package:menshop/networking/end_points.dart';
import 'package:menshop/login/state.dart';
class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitial());
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool obscureText=true;
  void toggleEye(){
    obscureText=!obscureText;
    emit(LoginInitial());
  }
  void login()async{
    try{
      emit(LoginLoading());
      final Response response=await DioHelper.postRequest(
          endPoint:AppEndPoints.login,
          data: {
            "username":nameController.text ,
            "password": passwordController.text
          });
      if(response.statusCode==200||response.statusCode==201){
        emit(LoginSuccess(response.data.toString()));
      }
      else{
        emit(LoginFailure(response.data.toString()));
      }
    }on DioException catch(e){
      emit(LoginFailure(e.response!.data.toString()));
    }
    catch (e){
      emit(LoginFailure(e.toString()));
    }
    
  }

}