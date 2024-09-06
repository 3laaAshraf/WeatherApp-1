import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubits/get_Weather_cubit/get_weather_cubit.dart';

class FailPage extends StatelessWidget {
  const FailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var yy = BlocProvider.of<GetWeatherCubit>(context).y;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 238, 10, 10),
        Color.fromARGB(255, 255, 38, 0),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                yy,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'ConcertOne1',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
