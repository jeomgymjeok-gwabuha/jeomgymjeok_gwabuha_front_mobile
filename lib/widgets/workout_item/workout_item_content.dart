import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_controller.dart';

class WorkoutItemContent extends StatelessWidget {
  const WorkoutItemContent({
    super.key,
    required this.heightFactor,
    required this.set,
    required this.deleteWorkout,
  });

  final Animation<double> heightFactor;
  final List<MWorkoutSet> set;
  final void Function() deleteWorkout;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: heightFactor,
      child: Column(children: [
        ...set
            .map(
              (item) => Container(
                height: 52,
                padding: const EdgeInsets.symmetric(
                  horizontal: 52,
                  vertical: 12,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: pallete[Pallete.flash],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${item.sequence}Set',
                                style: types[Types.semi_sm]!.copyWith(
                                  color: pallete[Pallete.deepNavy],
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '${item.weight}kg',
                              style: types[Types.semi_sm]!.copyWith(
                                color: pallete[Pallete.alaskanBlue],
                              ),
                            ),
                          ]),
                    ),
                    Text(
                      '${item.count}개',
                      style: types[Types.semi_sm]!.copyWith(
                        color: pallete[Pallete.alaskanBlue],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        WorkoutController(
          deleteWorkout: deleteWorkout,
        ),
      ]),
    );
  }
}
