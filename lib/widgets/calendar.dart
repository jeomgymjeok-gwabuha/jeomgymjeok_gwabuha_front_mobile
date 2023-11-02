import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/year_selector.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 56),
              WorkoutCalendar(
                selectedDay: selectedDay,
                calendarFormat: calendarFormat,
                onDaySelected: selectDay,
              ),
            ],
          ),
          YearSelector(
            selectedDay: selectedDay,
            start: 2000,
            end: 2100,
            changeYear: changeYear,
          ),
        ],
      ),
    );
  }
}
