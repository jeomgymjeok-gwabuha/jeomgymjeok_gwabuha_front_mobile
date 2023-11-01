import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkoutCalendar extends StatefulWidget {
  const WorkoutCalendar({
    super.key,
    required this.selectedDay,
    required this.focusdDay,
    required this.calendarFormat,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final DateTime focusdDay;
  final CalendarFormat calendarFormat;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  State<WorkoutCalendar> createState() => _WorkoutCalendarState();
}

class _WorkoutCalendarState extends State<WorkoutCalendar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TableCalendar(
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      focusedDay: widget.focusdDay,
      calendarFormat: widget.calendarFormat,
      daysOfWeekHeight: 50,
      rowHeight: 50,
      selectedDayPredicate: (day) {
        return isSameDay(widget.selectedDay, day);
      },
      onDaySelected: widget.onDaySelected,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextFormatter: (date, locale) {
          return DateFormat.MMMM(locale).format(date);
        },
        headerPadding: const EdgeInsets.all(0),
        headerMargin: const EdgeInsets.only(bottom: 12),
        titleTextStyle: types[Types.semi_lg]!.copyWith(
          color: pallete[Pallete.white],
        ),
        decoration: BoxDecoration(
          color: pallete[Pallete.deepNavy],
        ),
        leftChevronIcon: SvgPicture.asset('assets/icons/arrow-left.svg'),
        rightChevronIcon: SvgPicture.asset('assets/icons/arrow-right.svg'),
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          final value = day.day.toString();

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                value,
                style: types[Types.light_md]!.copyWith(
                  color: pallete[Pallete.deepNavy],
                ),
              ),
            ),
          );
        },
        todayBuilder: (context, day, focusedDay) {
          final value = day.day.toString();

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                value,
                style: types[Types.light_md]!.copyWith(
                  color: pallete[Pallete.deepNavy],
                ),
              ),
            ),
          );
        },
        selectedBuilder: (context, day, focusedDay) {
          final value = day.day.toString();
          return Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: pallete[Pallete.deepNavy],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(value,
                    style: types[Types.semi_md]!.copyWith(
                      color: pallete[Pallete.flash],
                    )),
              ),
            ),
          );
        },
        outsideBuilder: (context, day, focusedDay) {
          final value = day.day.toString();
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(value,
                  style: types[Types.light_md]!.copyWith(
                    color: pallete[Pallete.alaskanBlue],
                  )),
            ),
          );
        },
        dowBuilder: (context, day) {
          final weekDay = day.weekday;
          List<String> list = ['_', 'M', 'T', 'W', 'T', 'F', 'S', 'S'];

          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                list[weekDay],
                style: types[Types.semi_md]!.copyWith(
                  color: pallete[Pallete.deepNavy],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
