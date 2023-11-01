import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/year_selector.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  int _selectedYear = DateTime.now().year;

  void _changeYear(int value) {
    setState(() {
      _selectedYear = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Stack(
        children: [
          const WorkoutCalendar(),
          YearSelector(
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
