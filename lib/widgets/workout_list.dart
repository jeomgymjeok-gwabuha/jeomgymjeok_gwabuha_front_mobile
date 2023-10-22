import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/index.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({
    super.key,
    required this.list,
  });

  final List<MWorkoutItem> list;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) => WorkoutItem(
        workout: list[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(
        height: 2,
      ),
    );
  }
}
