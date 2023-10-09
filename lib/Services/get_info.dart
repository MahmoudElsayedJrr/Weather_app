import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/Models/info_model.dart';

class getWeather {
  final Dio dio = Dio();

  Future<infoModel> getCurrentTemp({required String country}) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=c2ee36082e3240b6b76155754230510&q=$country');
      infoModel X = infoModel.fromjson(response.data);
      return X;
    } on DioException catch (e) {
      final String err = e.response?.data['error']['message'] ??
          'There Was than error, try later';
      throw Exception(err);
    }
  }
}
