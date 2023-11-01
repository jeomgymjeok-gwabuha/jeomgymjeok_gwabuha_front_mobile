import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/year_selector.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  void _changeYear(int value) {
    setState(() {
      _selectedDay = DateTime(
        value,
        _selectedDay.month,
        _selectedDay.day,
      );
      _focusedDay = _selectedDay;
    });
  }

  void selectDay(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _calendarFormat = CalendarFormat.week;
    });
  }

  get _selectedYear {
    return _selectedDay.year;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Stack(
        children: [
          WorkoutCalendar(
            selectedDay: _selectedDay,
            focusdDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: selectDay,
          ),
          YearSelector(
            selectedDay: _selectedDay,
            value: _selectedYear,
            start: 2000,
            end: 2100,
            changeYear: _changeYear,
          ),
        ],
      ),
    );
  }
}
