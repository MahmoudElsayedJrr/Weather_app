import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Screens/faliure_weather.dart';
import 'package:weather_app/Screens/no_weather.dart';
import 'package:weather_app/Screens/search_screen.dart';
import 'package:weather_app/Screens/yes_weather.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  bool light = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* drawer: Drawer(
            child: ListView(children: [
          SwitchListTile(
              title: Text('Dark Mode'),
              value: light,
              onChanged: (bool value) {
                setState(() {
                  light = value;
                });
              })
        ])), */
        appBar: AppBar(
            title: const Text('Weather App', style: TextStyle(fontSize: 20)),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const searchScreen();
                    }));
                  },
                  icon: const Icon(Icons.search)),
            ]),
        body: BlocBuilder<getWeatherCubit, weatherState>(
          builder: (context, state) {
            if (state is noWeatherState)
              return noWeatherInfo();
            else if (state is yesWeatherState)
              return weatherInfo();
            else
              return faliureWeather();
          },
        ));
  }
}
