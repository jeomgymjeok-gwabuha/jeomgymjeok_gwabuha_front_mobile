import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';
import 'package:jeomgymjeok_gwabuha/providers/workout_provider.dart';
import 'package:jeomgymjeok_gwabuha/screens/add_workout.dart';
import 'package:jeomgymjeok_gwabuha/widgets/calendar_section.dart';
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

  void _onPrevMonth(DateTime prevMonth) {
    ref.read(dateProvider.notifier).setDate(prevMonth);
  }

  void _onNextMonth(DateTime nextMonth) {
    ref.read(dateProvider.notifier).setDate(nextMonth);
  }

  void _addNewWorkout(DateTime selectedDay) async {
    Map<String, Object>? response =
        await Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => AddWorkout(selectedDay: selectedDay),
    ));

    if (response != null) {
      final recordDate = response['recordDate'] as String;
      final newWorkoutItem = response['newWorkoutItem'] as MWorkoutItem;

      setState(() {
        ref
            .read(workoutProvider.notifier)
            .addWorkout(recordDate, newWorkoutItem);
      });
    }
  }

  void _deleteWorkout(String id) {
    DateTime _selectedDay = ref.watch(dateProvider);
    final recordDate = DateFormat('yyyy.MM.dd').format(_selectedDay);

    setState(() {
      ref.read(workoutProvider.notifier).deleteWorkout(recordDate, id);
    });
  }

  void _deleteWorkoutList(List<String> ids) {
    DateTime _selectedDay = ref.watch(dateProvider);
    final recordDate = DateFormat('yyyy.MM.dd').format(_selectedDay);

    setState(() {
      ref.read(workoutProvider.notifier).deleteWorkoutList(recordDate, ids);
    });
  }

  get _selectedFormattedDay {
    return DateFormat('yyyy.MM.dd').format(ref.watch(dateProvider));
  }

  @override
  Widget build(BuildContext context) {
    Map<String, List<MWorkoutItem>> _workout = ref.watch(workoutProvider);
    DateTime _selectedDay = ref.watch(dateProvider);

    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          if (isSelectDate)
            Column(
              children: [
                const SizedBox(height: 228),
                Expanded(
                  child: WorkoutList(
                    list: _workout[_selectedFormattedDay] ?? [],
                    deleteWorkout: _deleteWorkout,
                    deleteWorkoutList: _deleteWorkoutList,
                  ),
                ),
              ],
            ),
          CalendarSection(
            selectedDay: _selectedDay,
            calendarFormat: _calendarFormat,
            selectDay: _selectDay,
            changeYear: _changeYear,
            onNextMonth: _onNextMonth,
            onPrevMonth: _onPrevMonth,
          ),
          if (isSelectDate)
            Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: pallete[Pallete.deepNavy],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: IconButton(
                    onPressed: () => _addNewWorkout(_selectedDay),
                    icon: SvgPicture.asset(
                      'assets/icons/union.svg',
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
