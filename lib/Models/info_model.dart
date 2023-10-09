import 'package:weather_app/Screens/yes_weather.dart';

class infoModel {
  final String updateTime;
  final String cityName;
  final double temp_c;
  final double maxtemp_c;
  final double mintemp_c;
  final String stauts;
  final String img;

  infoModel(
      {required this.mintemp_c,
      required this.stauts,
      required this.cityName,
      required this.updateTime,
      required this.temp_c,
      required this.img,
      required this.maxtemp_c});

  factory infoModel.fromjson(json) {
    return infoModel(
      mintemp_c: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxtemp_c: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      temp_c: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      stauts: json['forecast']['forecastday'][0]['day']['condition']['text'],
      cityName: json['location']['name'],
      updateTime: json['current']['last_updated'],
      img: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
