
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'apis.dart';



@RestApi(baseUrl: "https://api.open-meteo.com/v1")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.weekly)
  Future<ResponseData> getWeekly();


  @GET(Apis.daily)
  Future<ResponseData> getDaily();

}








class ResponseData {
}


