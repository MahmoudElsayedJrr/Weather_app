import 'package:flutter/material.dart';

class faliureWeather extends StatelessWidget {
  const faliureWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Text(
          'Please enter the country correctly',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class faliureCountryWeather extends StatelessWidget {
  const faliureCountryWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Text(
          'There is no country with this name, try again',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
