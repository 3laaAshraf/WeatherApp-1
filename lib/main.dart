import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Pages/home_page.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const MaterialApp(
          // theme: ThemeData(primarySwatch: Colors.amber),
          debugShowCheckedModeBanner: false,
          home: HomePage()),
    );
  }
}
