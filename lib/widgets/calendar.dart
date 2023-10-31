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
  List<int> years = [
    2011,
    2022,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028
  ];

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1,
      ),
      child: Stack(
        children: [
          WorkoutCalendar(),
          YearSelector(),
        ],
      ),
    );
  }
}
