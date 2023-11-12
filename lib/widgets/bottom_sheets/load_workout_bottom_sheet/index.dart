import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/load_workout_searchbar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/load_workout_titlebar.dart';

class LoadWorkoutBottomSheet extends StatelessWidget {
  const LoadWorkoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        LoadWorkoutTitlebar(),
        LoadWorkoutSearchbar(),
      ],
    );
  }
}
