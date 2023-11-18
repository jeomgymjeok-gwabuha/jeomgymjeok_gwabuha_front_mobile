import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class Calendar extends StatefulWidget {
  Calendar({
    super.key,
    required this.selectedDay,
    required this.calendarFormat,
    required this.onDaySelected,
    required this.onPrevMonth,
    required this.onNextMonth,
    this.type = 'workout',
  });

  final DateTime selectedDay;
  final CalendarFormat calendarFormat;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final void Function(DateTime prevMonth) onPrevMonth;
  final void Function(DateTime nextMonth) onNextMonth;
  String? type;

  @override
  State<Calendar> createState() => _WorkoutCalendarState();
}

class _WorkoutCalendarState extends State<Calendar> {
  void _onPrevMonth() {
    final value = widget.selectedDay.month - 1;
    final month = value < 1 ? 12 : value;
    final year =
        value < 1 ? widget.selectedDay.year - 1 : widget.selectedDay.year;
    final newDateTime = DateTime(year, month, widget.selectedDay.day);

    widget.onPrevMonth(newDateTime);
  }

  void _onNextMonth() {
    final value = widget.selectedDay.month + 1;
    final month = value > 12 ? 1 : value;
    final year =
        value > 12 ? widget.selectedDay.year + 1 : widget.selectedDay.year;
    final newDateTime = DateTime(year, month, widget.selectedDay.day);

    widget.onNextMonth(newDateTime);
  }

  void onPageChanged(DateTime date) {
    widget.onDaySelected(date, date);
  }

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
                    onPressed: _onPrevMonth,
                    icon: SvgPicture.asset('assets/icons/arrow-left.svg'),
                  ),
                  IconButton(
                    iconSize: 24,
                    splashRadius: 12,
                    onPressed: _onNextMonth,
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
          onPageChanged: onPageChanged,
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
                      color: widget.type == 'workout'
                          ? pallete[Pallete.deepNavy]
                          : pallete[Pallete.white],
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
                      color: widget.type == 'workout'
                          ? pallete[Pallete.deepNavy]
                          : pallete[Pallete.white],
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
                    color: widget.type == 'workout'
                        ? pallete[Pallete.deepNavy]
                        : pallete[Pallete.flash],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(value,
                        style: types[Types.semi_md]!.copyWith(
                          color: widget.type == 'workout'
                              ? pallete[Pallete.flash]
                              : pallete[Pallete.deepNavy],
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
                        color: widget.type == 'workout'
                            ? pallete[Pallete.alaskanBlue]
                            : pallete[Pallete.white]!.withOpacity(0.5),
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
                      color: widget.type == 'workout'
                          ? pallete[Pallete.deepNavy]
                          : pallete[Pallete.white],
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
