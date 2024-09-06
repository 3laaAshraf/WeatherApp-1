import 'package:news_app/Classes/weather_class.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherClass weatherModel;
  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {
  String x;
  WeatherFailureState({required this.x});
}

class WeatherLoading extends WeatherState {}
