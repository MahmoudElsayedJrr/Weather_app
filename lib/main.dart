import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/home_screen.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

void main() {
  // getWeather().getCurrentTemp(country: 'Egypt');
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getWeatherCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<getWeatherCubit, weatherState>(
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primarySwatch: getWeatherColor(
                        BlocProvider.of<getWeatherCubit>(context)
                            .getInfo
                            ?.stauts)),
                //theme: light ? darkThemeData(context) : lightThemeData(context),
                home: homeScreen(),
              );
            },
          );
        }));
  }
}

MaterialColor? getWeatherColor(String? day) {
  if (day == 'Sunny' || day == 'Clear') {
    return Colors.yellow;
  } else if (day == 'Partly cloudy') {
    return Colors.orange;
  } else if (day == 'Cloudy' ||
      day == 'Overcast' ||
      day == 'Mist' ||
      day == 'Blowing snow' ||
      day == 'Blizzard' ||
      day == 'Fog' ||
      day == 'Freezing fog') {
    return Colors.grey;
  } else if (day == 'Patchy rain possible' ||
      day == 'Patchy snow possible' ||
      day == 'Patchy sleet possible' ||
      day == 'Patchy freezing drizzle possible' ||
      day == 'Thundery outbreaks possible' ||
      day == 'Patchy light drizzle' ||
      day == 'Light drizzle' ||
      day == 'Freezing drizzle' ||
      day == 'Heavy freezing drizzle' ||
      day == 'Light sleet' ||
      day == 'Moderate or heavy sleet' ||
      day == 'Patchy light snow' ||
      day == 'Light snow' ||
      day == 'Patchy moderate snow' ||
      day == 'Moderate snow' ||
      day == 'Patchy heavy snow' ||
      day == 'Heavy snow' ||
      day == 'Ice pellets') {
    return Colors.brown;
  } else if (day == 'Patchy light rain' ||
      day == 'Light rain' ||
      day == 'Moderate rain at times' ||
      day == 'Moderate rain' ||
      day == 'Heavy rain at times' ||
      day == 'Heavy rain' ||
      day == 'Light freezing rain' ||
      day == 'Moderate or heavy freezing rain') {
    return Colors.green;
  } else if (day == 'Light rain shower' ||
      day == 'Moderate or heavy rain shower' ||
      day == 'Torrential rain shower' ||
      day == 'Light sleet showers' ||
      day == 'Moderate or heavy sleet showers' ||
      day == 'Light snow showers' ||
      day == 'Moderate or heavy snow showers' ||
      day == 'Light showers of ice pellets' ||
      day == 'Moderate or heavy showers of ice pellets') {
    return Colors.lightBlue;
  } else if (day == 'Patchy light rain with thunder' ||
      day == 'Moderate or heavy rain with thunder' ||
      day == 'Patchy light snow with thunder' ||
      day == 'Moderate or heavy snow with thunder') {
    return Colors.deepPurple;
  } else
    return Colors.blue;
}
