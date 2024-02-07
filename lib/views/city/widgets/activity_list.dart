import 'package:flutter/material.dart';

import 'activity_card.dart';
import '../../../models/activity_model.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;
  final Function toggleActivity;
  final List<String> selectedActivities;
  const ActivityList(
      {super.key,
      required this.activities,
      required this.toggleActivity,
      required this.selectedActivities});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: activities
          .map(
            (activity) => ActivityCard(
              activity: activity,
              isSelected: selectedActivities.contains(activity.id),
              toggleActivity: () => toggleActivity(activity.id),
            ),
          )
          .toList(),
    );
  }
}
