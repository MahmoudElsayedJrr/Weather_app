import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/info_model.dart';
import 'package:weather_app/Services/get_info.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

class getWeatherCubit extends Cubit<weatherState> {
  getWeatherCubit() : super(noWeatherState());
  infoModel? getInfo;
  getInfoFunction({required String value}) async {
    try {
      getInfo = await getWeather().getCurrentTemp(country: value);
      emit(yesWeatherState(getInfo!));
    } catch (e) {
      emit(failurerWeatherState());
    }
  }
}

class SwitchTheme extends Cubit<weatherState> {
  infoModel? getInfo;
  SwitchTheme(super.initialState);
  getInfoFunction({required String value}) async {
    try {
      getInfo = await getWeather().getCurrentTemp(country: value);
      emit(yesWeatherState(getInfo!));
    } catch (e) {
      emit(failurerWeatherState());
    }
  }
}
