import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/year_selector.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends ConsumerStatefulWidget {
  const Calendar({
    super.key,
    required this.selectedDay,
    required this.calendarFormat,
    required this.selectDay,
    required this.changeYear,
  });

  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final void Function(DateTime selectedDay, DateTime focusedDay) selectDay;
  final void Function(int value) changeYear;

  @override
  ConsumerState<Calendar> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends ConsumerState<Calendar> {
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
            calendarFormat: widget.calendarFormat,
            onDaySelected: widget.selectDay,
          ),
          YearSelector(
            selectedDay: _selectedDay,
            start: 2000,
            end: 2100,
            changeYear: widget.changeYear,
          ),
        ],
      ),
    );
  }
}
