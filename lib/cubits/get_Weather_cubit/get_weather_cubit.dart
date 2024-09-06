//Cubit Maneges States
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Classes/weather_class.dart';
import 'package:news_app/Services/weather_service.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
  late WeatherClass weatherclass;
  late String y;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoading());
      weatherclass =
          await WeatherService(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadedState(weatherModel: weatherclass));
    } catch (e) {
      y = await WeatherService(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherFailureState(x: y));
    }
  }
}
