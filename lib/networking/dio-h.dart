import 'package:dio/dio.dart';
import 'package:menshop/networking/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
class DioHelper{
  static Dio?dio;
  static initDio(){
    dio ??=Dio(
        BaseOptions(
            baseUrl: AppEndPoints.baseUrl,
            receiveDataWhenStatusError: true
        )
    );
    dio!.interceptors.add(PrettyDioLogger());
  }
  static getRequest({required String endPoint})async{
    try {
      Response response=await dio!.get(endPoint);

      return response;

    }catch(e){
      rethrow;
    }

  }
  static postRequest({required String endPoint,required Map<String,dynamic>data})async{
    try {
      Response response=await dio!.post(endPoint, data: data);
      return response;
    }
    catch(e){
      rethrow;
    }
  }

}
