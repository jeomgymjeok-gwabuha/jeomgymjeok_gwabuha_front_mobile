import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends StateNotifier<DateTime> {
  DateNotifier() : super(DateTime.now());

  setDate(DateTime newDate) {
    state = newDate;
  }

  setYear(int year) {
    state = DateTime(year, state.month, state.day);
  }

  prevMonth() {
    final value = state.month - 1;
    final month = value < 1 ? 12 : value;
    final year = value < 1 ? state.year - 1 : state.year;
    state = DateTime(year, month, state.day);
  }

  nextMonth() {
    final value = state.month + 1;
    final month = value > 12 ? 1 : value;
    final year = value > 12 ? state.year + 1 : state.year;
    state = DateTime(year, month, state.day);
  }
}

final dateProvider =
    StateNotifierProvider<DateNotifier, DateTime>((ref) => DateNotifier());
