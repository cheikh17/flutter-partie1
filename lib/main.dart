import 'package:cheikh_trip/views/404/not_found.dart';
import 'package:flutter/material.dart';

import './views/city/widgets/city_view.dart';
import './views/home/widgets/city_card.dart';
import './views/home/home_view.dart';
import 'models/city_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'cheikh trip',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        fontFamily: 'montserrat',
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic)),
        appBarTheme:
            AppBarTheme(backgroundColor: Theme.of(context).primaryColorDark),
      ),
      initialRoute: '/',
      routes: {
        HomeView.routeName: (context) => const HomeView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == CityView.routeName) {
          final City city = settings.arguments as City;
          return MaterialPageRoute(
            builder: (context) {
              return CityView(city: city);
            },
          );
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const NotFound());
      },
    );
  }
}
