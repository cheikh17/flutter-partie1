import 'package:flutter/material.dart';
import '../../models/city_model.dart';
import 'widgets/city_card.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeState();
}

class _HomeState extends State<HomeView> {
  List<City> cities = [
    City(name: 'London', image: "assets/images/first destination.jpg"),
    City(name: 'Dakar', image: "assets/images/la vie de pi.jpg"),
    City(name: 'vietnam', image: "assets/images/vietnam.jpg"),
    City(name: 'Kaolack', image: "assets/images/second destination.jpg"),
    City(name: 'Tambacounda', image: "assets/images/third destination.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Cheikh Trip'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cities
              .map((city) => CityCard(
                    city: city,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
