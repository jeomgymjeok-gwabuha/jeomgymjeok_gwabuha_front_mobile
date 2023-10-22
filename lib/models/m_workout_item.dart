import 'package:uuid/uuid.dart';

const uuid = Uuid();

class MWorkoutSet {
  const MWorkoutSet({
    required this.sequence,
    required this.weight,
    required this.count,
  });

  final int sequence;
  final int weight;
  final int count;
}

class MWorkoutItem {
  MWorkoutItem({
    String? id,
    required this.name,
    required this.set,
  }) : id = id ?? uuid.v4();

  final String id;
  final String name;
  final List<MWorkoutSet> set;
}
