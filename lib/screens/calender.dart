import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';
import 'package:jeomgymjeok_gwabuha/providers/workout_provider.dart';
import 'package:jeomgymjeok_gwabuha/widgets/calendar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_list.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  bool isSelectDate = false;

  void _changeYear(int value) {
    ref.read(dateProvider.notifier).setYear(value);
  }

  void _selectDay(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      ref.read(dateProvider.notifier).setDate(selectedDay);
      _calendarFormat = CalendarFormat.week;
      isSelectDate = true;
    });
  }

  get _selectedFormattedDay {
    return DateFormat('yyyy.MM.dd').format(ref.watch(dateProvider));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<MWorkoutItem>> _workout = ref.watch(workoutProvider);
    DateTime _selectedDay = ref.watch(dateProvider);

    return Container(
      height: double.infinity,
      child: Column(
        children: [
          Calendar(
            selectedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            selectDay: _selectDay,
            changeYear: _changeYear,
          ),
          if (isSelectDate)
            Expanded(
              child: WorkoutList(
                list: _workout[_selectedFormattedDay] ?? [],
              ),
            ),
        ],
      ),
    );
  }
}
