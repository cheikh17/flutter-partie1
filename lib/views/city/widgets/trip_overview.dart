import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/trip_model.dart';

class TripOverview extends StatelessWidget {
  final Trip mytrip;
  final VoidCallback setDate;
  final String cityName;

  double get amount {
    return 0;
  }

  const TripOverview(
      {super.key,
      required this.mytrip,
      required this.setDate,
      required this.cityName});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final size = MediaQuery.of(context).size;

    return Container(
      //SizedBox ou Container
      height: 200,
      width: orientation == Orientation.landscape
          ? size.width * 0.5
          : double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  mytrip.date != null
                      ? DateFormat('d/M/y').format(mytrip.date)
                      : 'Sélectionnez une date',
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: setDate,
                child: const Text('selectionner une date'),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: <Widget>[
              const Text(
                'Montant/Personne',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                ' $amount \$',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
