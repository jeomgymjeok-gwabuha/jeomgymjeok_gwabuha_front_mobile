import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/models/m_importing_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/providers/workout_provider.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/load_workout_searchbar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/load_workout_titlebar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/searched_result.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';

class LoadWorkoutBottomSheet extends ConsumerStatefulWidget {
  const LoadWorkoutBottomSheet({super.key});

  @override
  ConsumerState<LoadWorkoutBottomSheet> createState() =>
      _LoadWorkoutBottomSheetState();
}

const List<String> options = ['entire', 'select'];

class _LoadWorkoutBottomSheetState
    extends ConsumerState<LoadWorkoutBottomSheet> {
  final SearchController _searchController = SearchController();
  List<MImportingWorkoutItem> _searchedList = [];
  bool _isUsedToSearch = false;
  String selectedWorkoutItemId = '';
  String selectedOption = options.first;
  DateTime startTime = DateTime.now();
  DateTime lastTime = DateTime.now();
  bool isInvalidName = false;

  void changeStartTime(DateTime dateTime) {
    setState(() {
      startTime = dateTime;
    });
  }

  void changeLastTime(DateTime dateTime) {
    setState(() {
      lastTime = dateTime;
    });
  }

  void _searchWorkout(List<MImportingWorkoutItem> list) {
    setState(() {
      _searchedList = list;
      _isUsedToSearch = true;
    });
  }

  void selectWorkoutItemId(String id) {
    setState(() {
      selectedWorkoutItemId = id;
    });
  }

  void selectOption(String? value) {
    setState(() {
      selectedOption = value!;
    });
  }

  void importWorkout() {
    if (selectedWorkoutItemId.isEmpty) {
      return;
    }

    var item = _searchedList
        .firstWhere((element) => element.id == selectedWorkoutItemId);
    Navigator.of(context).pop(item);
  }

  void reset() {
    setState(() {
      _searchController.text = '';
      _searchedList = [];
      _isUsedToSearch = false;
      selectedWorkoutItemId = '';
      selectedOption = options.first;
      startTime = DateTime.now();
      lastTime = DateTime.now();
      isInvalidName = false;
    });
  }

  void submit() {
    setState(() {
      isInvalidName = false;
    });

    if (_searchController.text.isEmpty) {
      setState(() {
        isInvalidName = true;
      });

      return;
    }

    final workout = ref.watch(workoutProvider);
    final Map<String, List<MImportingWorkoutItem>> workoutMap = {};

    workout.forEach((key, value) {
      for (var item in value) {
        if (workoutMap.containsKey(item.name)) {
          workoutMap[item.name]!.add(MImportingWorkoutItem(
              dateTime: key, set: item.set, name: item.name));
        } else {
          workoutMap[item.name] = [
            MImportingWorkoutItem(dateTime: key, set: item.set, name: item.name)
          ];
        }
      }
    });

    List<MImportingWorkoutItem> list = [];

    if (selectedOption == 'entire') {
      list = workoutMap[_searchController.text] ?? [];
    } else {
      list = (workoutMap[_searchController.text] ?? []).where((element) {
        DateTime date = DateFormat('yyyy.MM.dd').parse(element.dateTime);
        bool isStart =
            date.isAtSameMomentAs(startTime) || date.isAfter(startTime);
        bool isEnd = date.isBefore(lastTime);

        return isStart && isEnd;
      }).toList();
    }

    list.sort((a, b) {
      DateTime aDate = DateFormat('yyyy.MM.dd').parse(a.dateTime);
      DateTime bDate = DateFormat('yyyy.MM.dd').parse(b.dateTime);

      return bDate.compareTo(aDate);
    });

    _searchWorkout(list);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoadWorkoutTitlebar(),
        LoadWorkoutSearchbar(
          isInvalidName: isInvalidName,
          selectedOption: selectedOption,
          searchController: _searchController,
          startTime: startTime,
          lastTime: lastTime,
          selectOption: selectOption,
          changeStartTime: changeStartTime,
          changeLastTime: changeLastTime,
          searchWorkout: _searchWorkout,
          submit: submit,
          reset: reset,
        ),
        if (_isUsedToSearch)
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 12),
                Expanded(
                  child: SerachedResult(
                    searchedList: _searchedList,
                    selectedWorkoutItemId: selectedWorkoutItemId,
                    selectWorkoutItemId: selectWorkoutItemId,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: pallete[Pallete.deepNavy],
                ),
                const SizedBox(height: 12),
                Opacity(
                  opacity: selectedWorkoutItemId.isEmpty ? 0.5 : 1.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextBtn(
                      text: '불러오기',
                      onPressed:
                          selectedWorkoutItemId.isEmpty ? null : importWorkout,
                      width: double.infinity,
                      height: 56,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
      ],
    );
  }
}
