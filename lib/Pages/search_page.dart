import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Search a City',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Acme',
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 19, 5, 171),
            Color.fromARGB(255, 74, 4, 237)
          ],
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        )),
        child: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'City Name',
                  style: TextStyle(
                      height: 3,
                      fontSize: 30,
                      fontFamily: 'Merienda',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 233, 158, 158)),
                ),
                TextField(
                  onSubmitted: (value) async {
                    var getWeatherCubitData =
                        BlocProvider.of<GetWeatherCubit>(context);
                    getWeatherCubitData.getWeather(cityName: value);

                    Navigator.pop(context);
                  },
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 15),
                    labelText: 'Search',
                    labelStyle:
                        const TextStyle(fontSize: 25, color: Colors.black),
                    hintText: 'Enter City Name',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 19, 5, 171),
                    suffixIcon: const Icon(Icons.search),
                    suffixIconColor: const Color.fromARGB(255, 201, 180, 231),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 8, 8, 8),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 4, 4, 4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
