import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends StateNotifier<DateTime> {
  DateNotifier() : super(DateTime.now());

  setDate(DateTime newDate) {
    state = newDate;
  }

  setYear(int year) {
    state = DateTime(year, state.month, state.day);
  }
}

final dateProvider =
    StateNotifierProvider<DateNotifier, DateTime>((ref) => DateNotifier());
