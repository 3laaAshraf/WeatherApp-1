import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_cubit.dart';

class WeatherInfoBodyPage extends StatelessWidget {
  const WeatherInfoBodyPage({super.key});
//with every weather change gradient
  @override
  Widget build(BuildContext context) {
    var weatherObject = BlocProvider.of<GetWeatherCubit>(context).weatherclass;
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the AppBar

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          getColor(weatherObject.condition),
          // Color.fromARGB(255, 0, 81, 255),
          const Color.fromARGB(255, 221, 209, 236)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherObject.city,
              style: const TextStyle(
                  height: 0.9, fontSize: 45, fontFamily: 'LilitaOne'),
            ),
            FittedBox(
              alignment: Alignment.topCenter,
              child: Text(
                'updated at ${weatherObject.date.hour}:${weatherObject.date.minute}',
                style: const TextStyle(
                    height: 1,
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'ConcertOne1',
                    color: Color.fromARGB(110, 0, 0, 0)),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 130,
                  width: 110,
                  child: Image.network('https:${weatherObject.image}',
                      fit: BoxFit.cover),
                  // Image.asset(
                  //     'assets/images/clear.png',
                  //     fit: BoxFit.cover),
                ),
                Text(
                  '${weatherObject.temp}',
                  style: const TextStyle(
                      fontSize: 45,
                      //fontWeight: FontWeight.bold,
                      fontFamily: 'ConcertOne1',
                      color: Colors.black),
                ),
                Column(
                  children: [
                    Text(
                      'maxtemp: ${weatherObject.maxTemp.round()}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ConcertOne1',
                          color: Colors.black54),
                    ),
                    Text(
                      'mintemp: ${weatherObject.minTemp.round()}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'ConcertOne1',
                          color: Colors.black54),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              weatherObject.condition,
              style: const TextStyle(
                  fontSize: 40,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

Color getColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'partly cloudy':
      return Colors.lightBlueAccent;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.grey;
    case 'mist':
      return Colors.blueGrey;
    case 'patchy rain possible':
      return Colors.lightBlue;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.blueGrey;
    case 'patchy freezing drizzle possible':
      return Colors.blueGrey;
    case 'thundery outbreaks possible':
      return Colors.deepPurple;
    case 'blowing snow':
      return Colors.white70;
    case 'blizzard':
      return Colors.white;
    case 'fog':
      return Colors.blueGrey;
    case 'freezing fog':
      return Colors.lightBlue;
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'light drizzle':
      return Colors.lightBlue;
    case 'freezing drizzle':
      return Colors.blueGrey;
    case 'heavy freezing drizzle':
      return Colors.blueGrey;
    case 'patchy light rain':
      return Colors.lightBlue;
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
      return Colors.blue;
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
      return Colors.blue;
    case 'heavy rain':
      return Colors.blue;
    case 'light freezing rain':
      return Colors.cyan;
    case 'moderate or heavy freezing rain':
      return Colors.cyan;
    case 'light sleet':
      return Colors.blueGrey;
    case 'moderate or heavy sleet':
      return Colors.blueGrey;
    case 'patchy light snow':
      return Colors.white;
    case 'light snow':
      return Colors.white;
    case 'patchy moderate snow':
      return Colors.white;
    case 'moderate snow':
      return Colors.white;
    case 'patchy heavy snow':
      return Colors.white;
    case 'heavy snow':
      return Colors.white;
    case 'ice pellets':
      return Colors.lightBlue;
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate or heavy rain shower':
      return Colors.lightBlue;
    case 'torrential rain shower':
      return Colors.lightBlue;
    case 'light sleet showers':
      return Colors.blueGrey;
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'light snow showers':
      return Colors.white;
    case 'moderate or heavy snow showers':
      return Colors.white;
    case 'light showers of ice pellets':
      return Colors.blueGrey;
    case 'moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    case 'patchy light rain with thunder':
      return Colors.deepPurpleAccent;
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy light snow with thunder':
      return Colors.purple;
    case 'moderate or heavy snow with thunder':
      return Colors.purple;
    default:
      return Colors.grey; // Default color if no match is found
  }
}
