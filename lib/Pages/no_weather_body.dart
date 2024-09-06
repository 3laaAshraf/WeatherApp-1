import 'package:flutter/material.dart';

class NoWeatherBodyPage extends StatelessWidget {
  const NoWeatherBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 154, 171, 235),
        Color.fromARGB(255, 255, 38, 0),
      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: const Padding(
        padding: EdgeInsets.only(right: 10.0, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                'there is no weather 😔 Start searching now 🔎',
                textAlign: TextAlign.center,
                style: TextStyle(
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
