import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class MImportingWorkoutItem {
  MImportingWorkoutItem({
    String? id,
    required this.name,
    required this.dateTime,
    required this.set,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final String dateTime;
  final List<MWorkoutSet> set;
}
