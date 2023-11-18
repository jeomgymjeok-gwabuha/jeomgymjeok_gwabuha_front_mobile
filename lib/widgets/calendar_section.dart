import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/widgets/calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/year_selector.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarSection extends StatelessWidget {
  const CalendarSection({
    super.key,
    required this.selectedDay,
    required this.calendarFormat,
    required this.selectDay,
    required this.changeYear,
    required this.onPrevMonth,
    required this.onNextMonth,
  });

  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final void Function(DateTime selectedDay, DateTime focusedDay) selectDay;
  final void Function(int value) changeYear;
  final void Function(DateTime prevMonth) onPrevMonth;
  final void Function(DateTime nextMonth) onNextMonth;

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
              Calendar(
                selectedDay: selectedDay,
                calendarFormat: calendarFormat,
                onDaySelected: selectDay,
                onPrevMonth: onPrevMonth,
                onNextMonth: onNextMonth,
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
