import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/year_selector.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends ConsumerStatefulWidget {
  const Calendar({super.key});

  @override
  ConsumerState<Calendar> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends ConsumerState<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _changeYear(int value) {
    ref.read(dateProvider.notifier).setYear(value);
  }

  void selectDay(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      ref.read(dateProvider.notifier).setDate(selectedDay);
      _calendarFormat = CalendarFormat.week;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDay = ref.watch(dateProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Stack(
        children: [
          WorkoutCalendar(
            selectedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: selectDay,
          ),
          YearSelector(
            selectedDay: _selectedDay,
            start: 2000,
            end: 2100,
            changeYear: _changeYear,
          ),
        ],
      ),
    );
  }
}
