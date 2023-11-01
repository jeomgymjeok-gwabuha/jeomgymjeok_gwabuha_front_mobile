import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeomgymjeok_gwabuha/data/dummy_workout_list.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';
import 'package:jeomgymjeok_gwabuha/widgets/calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_list.dart';

class CalendarScreen extends ConsumerWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MWorkoutItem> workoutList = dummyWorkoutList;

    return Container(
      height: double.infinity,
      child: const Column(
        children: [
          Calendar(),
          // Container(
          //   width: double.infinity,
          //   height: 40,
          //   color: pallete[Pallete.deepNavy],
          //   alignment: Alignment.centerRight,
          //   padding: const EdgeInsets.symmetric(horizontal: 36),
          //   child: TextButton(
          //     onPressed: () {},
          //     child: Text(
          //       '편집',
          //       style: types[Types.semi_md]!.copyWith(
          //         color: pallete[Pallete.white],
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 4),
          // Expanded(
          //   child: WorkoutList(
          //     list: workoutList,
          //   ),
          // ),
        ],
      ),
    );
  }
}
