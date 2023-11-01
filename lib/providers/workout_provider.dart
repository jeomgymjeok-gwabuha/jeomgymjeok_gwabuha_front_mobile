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
        });
}

final workoutProvider =
    StateNotifierProvider<WorkoutNotifier, Map<String, List<MWorkoutItem>>>(
        (ref) => WorkoutNotifier());

final datedWorkoutProvider = Provider((ref) {
  final selectedDate = ref.watch(dateProvider);
  final workout = ref.watch(workoutProvider);

  return workout[selectedDate] ?? [];
});
