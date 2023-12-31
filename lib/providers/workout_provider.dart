import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/data/dummy_workout_list.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';

class WorkoutNotifier extends StateNotifier<Map<String, List<MWorkoutItem>>> {
  WorkoutNotifier()
      : super({
          DateFormat('yyyy.MM.dd').format(DateTime.parse('20231101')):
              dummyWorkoutList,
          DateFormat('yyyy.MM.dd').format(DateTime.parse('20231110')):
              dummyWorkoutList,
          DateFormat('yyyy.MM.dd').format(DateTime.parse('20231111')):
              dummyWorkoutList,
        });

  addWorkout(String recordDate, MWorkoutItem newWorkout) {
    if (state.containsKey(recordDate)) {
      state[recordDate]!.add(newWorkout);
    } else {
      state[recordDate] = [newWorkout];
    }
  }

  replaceWorkout(String id, String prevRecordDate, String newRecordDate,
      MWorkoutItem newWorkout) {
    if (prevRecordDate != newRecordDate) {
      deleteWorkout(prevRecordDate, id);
      addWorkout(newRecordDate, newWorkout);
    } else {
      state[prevRecordDate] = state[prevRecordDate]!.map((element) {
        if (element.id == id) {
          return newWorkout;
        }

        return element;
      }).toList();
    }
  }

  deleteWorkout(String recordDate, String id) {
    if (state.containsKey(recordDate)) {
      state[recordDate] =
          state[recordDate]!.where((element) => element.id != id).toList();
    }
  }

  deleteWorkoutList(String recordDate, List<String> ids) {
    if (state.containsKey(recordDate)) {
      state[recordDate] = state[recordDate]!
          .where((element) => !ids.contains(element.id))
          .toList();
    }
  }
}

final workoutProvider =
    StateNotifierProvider<WorkoutNotifier, Map<String, List<MWorkoutItem>>>(
        (ref) => WorkoutNotifier());

final datedWorkoutProvider = Provider((ref) {
  final selectedDate = ref.watch(dateProvider);
  final workout = ref.watch(workoutProvider);

  return workout[selectedDate] ?? [];
});

final workoutNames = Provider((ref) {
  final workout = ref.watch(workoutProvider);
  Set<String> names = {};

  workout.forEach((key, value) {
    for (var item in value) {
      names.add(item.name);
    }
  });

  return names.toList();
});
