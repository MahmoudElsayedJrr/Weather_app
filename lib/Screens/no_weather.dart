import 'package:flutter/material.dart';

class noWeatherInfo extends StatelessWidget {
  const noWeatherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(16),
        child: Text(
          'No Weather Information please Search from country to get results',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
