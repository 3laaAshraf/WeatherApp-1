class WeatherClass {
  final String city;
  final DateTime date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;
  WeatherClass(
      {required this.city,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});

  factory WeatherClass.fromjson(json) {
    return WeatherClass(
        city: json['location']['name'],
        date: DateTime.parse('${json['current']['last_updated']}'),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}

// Dio dio = Dio();
//   Response respnse = await dio.get(
//       'http://api.weatherapi.com/v1/forecast.json?key=ff760e6cc84349e8855141237242508&q=cairo&days=10');
//   Map<String, dynamic> Location = respnse.data['location'];
//   var locationName = Location['name'];
//   var date = Location['localtime'];

//   Map<String, dynamic> current = respnse.data['current'];
//   var tempDegree = current['temp_c'];

//   dynamic condition = current['condition'];
//   var conditionName = condition['text'];

//   Map<String, dynamic> forecast = respnse.data['forecast'];
//   List<dynamic> forcastData = forecast['forecastday'];
//   var values = forcastData[0];
//   var dayData = values['day'];
//   var maxTemp = dayData['maxtemp_c'];
//   var minTemp = dayData['mintemp_c'];
//   print(locationName);
//   print(date);
//   print(tempDegree);
//   print(maxTemp);
//   print(minTemp);
//   print(conditionName);
  