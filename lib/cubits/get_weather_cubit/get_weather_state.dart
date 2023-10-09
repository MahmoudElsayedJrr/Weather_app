import 'package:weather_app/Models/info_model.dart';

class weatherState {}

class noWeatherState extends weatherState {}

class yesWeatherState extends weatherState {
  final infoModel infoModell;
  yesWeatherState(this.infoModell);
}

class failurerWeatherState extends weatherState {}
