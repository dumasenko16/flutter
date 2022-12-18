import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/model/ApiService.dart';
import 'package:weather_app_flutter/model/DayModel.dart';

class ApiService {
  Future<List<Day>?> getTemperature() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Day> _model = response.body as List<Day>;
        return _model;

      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}


class ApiConstants {
  static String baseUrl = 'https://api.open-meteo.com/v1/forecast?latitude=55.75&longitude=37.62&daily=temperature_2m_max,rain_sum,windspeed_10m_max&timezone=Europe%2FMoscow';

  }
