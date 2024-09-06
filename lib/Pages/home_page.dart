import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Pages/fail.dart';
import 'package:news_app/Pages/no_weather_body.dart';
import 'package:news_app/Pages/search_page.dart';
import 'package:news_app/Pages/weather_info_body.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_cubit.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather',
              style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Acme',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 3, 8, 74)),
            ),
            Text(
              'App',
              style: TextStyle(
                  fontSize: 38,
                  fontFamily: 'Acme',
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 161, 244, 6)),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const SearchPage();
              }));
            },
            icon: const Icon(
              Icons.search,
              size: 40,
            ),
          ),
        ],
      ),
      body: const Done(),
    );
  }
}

class Done extends StatelessWidget {
  const Done({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeatherBodyPage();
        } else if (state is WeatherLoadedState) {
          return const WeatherInfoBodyPage();
        } else if (state is WeatherLoading) {
          return const CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        } else {
          return const FailPage();
        }
      },
    );
  }
}
