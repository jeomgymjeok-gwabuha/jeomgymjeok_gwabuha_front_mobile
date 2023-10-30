import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/vertical_dotted_divider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarState();
  }
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.only(top: 57.31),
            child: TableCalendar(
              firstDay: DateTime(1800),
              lastDay: DateTime(3000),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              daysOfWeekHeight: 50,
              rowHeight: 50,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  _calendarFormat = CalendarFormat.week;
                });
              },
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
                leftChevronIcon:
                    SvgPicture.asset('assets/icons/arrow-left.svg'),
                rightChevronIcon:
                    SvgPicture.asset('assets/icons/arrow-right.svg'),
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
            ),
          ),
        ),
        Positioned(
          top: 1,
          left: 0,
          child: Column(
            children: [
              Container(
                width: fullWidth,
                height: 40,
                color: pallete[Pallete.deepNavy],
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: SizedBox(
                        width: fullWidth,
                        height: 40,
                        child: Center(
                          child: Text(
                            DateFormat('yyyy.MM.dd').format(_selectedDay),
                            style: types[Types.semi_lg]!.copyWith(
                              color: pallete[Pallete.white],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: 56,
                        height: 40,
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/toggle_calendar_btn.svg',
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 57,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                        ),
                        child: VerticalDottedDivider(
                          color: pallete[Pallete.white],
                          space: 0.5,
                          length: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              // Container(width: fullWidth, height: 200, color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }
}
