import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Screens/faliure_weather.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a city'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              if (value == 'israel' || value == 'Israel') {
                Navigator.pop(context);
                faliureCountryWeather();
              } else {
                var X = BlocProvider.of<getWeatherCubit>(context);
                X.getInfoFunction(value: value);
                Navigator.pop(context);
              }
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search_rounded),
              suffixIconColor: Colors.orange,
              labelText: 'Country',
              hintText: 'Enter Your Country Ex: Egypt',
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
