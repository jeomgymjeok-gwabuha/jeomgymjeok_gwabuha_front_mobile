import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/providers/date_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class WorkoutCalendar extends ConsumerStatefulWidget {
  const WorkoutCalendar({
    super.key,
    required this.selectedDay,
    required this.calendarFormat,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  ConsumerState<WorkoutCalendar> createState() => _WorkoutCalendarState();
}

class _WorkoutCalendarState extends ConsumerState<WorkoutCalendar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: pallete[Pallete.deepNavy],
          ),
          child: Stack(children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    iconSize: 24,
                    splashRadius: 12,
                    onPressed: () {
                      ref.read(dateProvider.notifier).prevMonth();
                    },
                    icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
                  ),
                  IconButton(
                    iconSize: 24,
                    splashRadius: 12,
                    onPressed: () {
                      ref.read(dateProvider.notifier).nextMonth();
                    },
                    icon: SvgPicture.asset('assets/icons/arrow-right.svg'),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  DateFormat('MMMM').format(widget.selectedDay),
                  style: types[Types.semi_lg]!.copyWith(
                    color: pallete[Pallete.white],
                  ),
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(height: 16),
        TableCalendar(
          firstDay: DateTime(1800),
          lastDay: DateTime(3000),
          focusedDay: widget.selectedDay,
          calendarFormat: widget.calendarFormat,
          daysOfWeekHeight: 50,
          rowHeight: 50,
          selectedDayPredicate: (day) {
            return isSameDay(widget.selectedDay, day);
          },
          onDaySelected: widget.onDaySelected,
          headerVisible: false,
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
        ),
      ],
    );
  }
}
