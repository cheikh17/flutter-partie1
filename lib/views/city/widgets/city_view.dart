import 'package:flutter/material.dart';

import '../../../models/city_model.dart';
import './activity_list.dart';
import './trip_activity_list.dart';
import '../../city/widgets/trip_overview.dart';

import '../../../datas/data.dart' as data;
import '../../../models/activity_model.dart';
import '../../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';

  final List<Activity> activities = data.activities;
  final City city;
  CityView({super.key, required this.city});

  showContext({
    required BuildContext context,
    required List<Widget> children,
  }) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.landscape) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      );
    } else {
      return Column(
        children: children,
      );
    }
  }

  @override
  State<CityView> createState() => _CityState();
}

class _CityState extends State<CityView> {
  late Trip mytrip;
  late int index;
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'Paris', date: DateTime.now());
    index = 0;
  }

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation Voyage'),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Container(
        // padding: const EdgeInsets.all(30),
        child: widget.showContext(
          context: context,
          children: <Widget>[
            TripOverview(
              mytrip: mytrip,
              setDate: setDate,
              cityName: widget.city.name,
            ),
            Expanded(
              child: index == 0
                  ? ActivityList(
                      activities: widget.activities,
                      selectedActivities: mytrip.activities,
                      toggleActivity: toggleActivity,
                    )
                  : TripActivityList(
                      activities: tripActivities,
                      deleteTripActivity: deleteTripActivity,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ('decouverte'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: ('Mes activite'),
          ),
        ],
        onTap: switchIndex,
      ),
    );
  }
}
