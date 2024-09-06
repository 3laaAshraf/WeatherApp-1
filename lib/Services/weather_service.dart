import 'package:dio/dio.dart';
import 'package:news_app/Classes/weather_class.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);

  final String baseURL = 'http://api.weatherapi.com';

  dynamic getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
          '$baseURL/v1/forecast.json?key=ff760e6cc84349e8855141237242508&q=$city&days=1');
      WeatherClass weatherclass = WeatherClass.fromjson(response.data);
      //print(weatherclass.condition);
      return weatherclass;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      return errorMessage;
      // throw Exception(errorMessage);
    } catch (e) {
      throw Exception('oops there was an error , try later');
    }
  }
}
