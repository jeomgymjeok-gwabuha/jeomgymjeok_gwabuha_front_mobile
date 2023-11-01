import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
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
    if (list.isNotEmpty) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: pallete[Pallete.deepNavy],
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '편집',
                style: types[Types.semi_md]!.copyWith(
                  color: pallete[Pallete.white],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) => WorkoutItem(
                workout: list[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 2,
              ),
            ),
          )
        ],
      );
    }

    return Center(
      child: Text(
        '근손실 예방이 필요합니다.',
        style: types[Types.extra_md]!.copyWith(
          color: pallete[Pallete.deepNavy],
        ),
      ),
    );
  }
}
