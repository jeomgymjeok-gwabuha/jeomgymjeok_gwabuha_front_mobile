import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/models/m_importing_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/load_workout_searchbar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/load_workout_titlebar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/searched_result.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';

class LoadWorkoutBottomSheet extends StatefulWidget {
  const LoadWorkoutBottomSheet({super.key});

  @override
  State<LoadWorkoutBottomSheet> createState() => _LoadWorkoutBottomSheetState();
}

const list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

class _LoadWorkoutBottomSheetState extends State<LoadWorkoutBottomSheet> {
  List<MImportingWorkoutItem> _searchedList = [];
  bool _isUsedToSearch = false;

  void _searchWorkout(List<MImportingWorkoutItem> list) {
    setState(() {
      _searchedList = list;
      _isUsedToSearch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(_searchedList);
    return Container(
      child: Column(
        children: [
          LoadWorkoutTitlebar(),
          LoadWorkoutSearchbar(
            searchWorkout: _searchWorkout,
          ),
          Expanded(
            child: SerachedResult(),
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: pallete[Pallete.deepNavy],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextBtn(
              text: '불러오기',
              onPressed: () {},
              width: double.infinity,
              height: 56,
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
