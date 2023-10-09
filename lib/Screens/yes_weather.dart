import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Models/info_model.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class weatherInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    infoModel getWeatherInfo =
        BlocProvider.of<getWeatherCubit>(context).getInfo!;
    // Color backGroundTheme = getWeatherColor(getWeatherInfo.stauts) as Color;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          getWeatherColor(getWeatherInfo.stauts) as Color,
          //getWeatherColor(getWeatherInfo.stauts)?[300] as Color,
          getWeatherColor(getWeatherInfo.stauts)?[50] as Color,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(getWeatherInfo.cityName,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(getWeatherInfo.updateTime.substring(10),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network('http:${getWeatherInfo.img}'),
              Text(getWeatherInfo.temp_c.toString(),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Column(
                children: [
                  Text('MaxTemp: ${getWeatherInfo.maxtemp_c.toString()}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 85, 83, 83))),
                  const SizedBox(height: 3),
                  Text('MinTemp: ${getWeatherInfo.mintemp_c.toString()}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 85, 83, 83))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(getWeatherInfo.stauts,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
