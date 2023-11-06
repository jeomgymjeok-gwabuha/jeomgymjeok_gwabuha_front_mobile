import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDateDialog extends StatefulWidget {
  const SelectDateDialog({
    super.key,
    required this.selectedDay,
    required this.years,
  });

  final DateTime selectedDay;
  final List<int> years;

  @override
  State<StatefulWidget> createState() {
    return _SelectDateDialogState();
  }
}

class _SelectDateDialogState extends State<SelectDateDialog>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late DateTime _focusedDay;
  late AnimationController _animatedcontroller;
  bool isSelectedYear = false;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusedDay = widget.selectedDay;
    _animatedcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      lowerBound: 0,
      upperBound: 1,
    );
    _animatedcontroller.forward();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final foundIndex =
          widget.years.indexWhere((element) => element == _focusedDay.year);
      final rowCount = (foundIndex ~/ 3).toDouble();
      _scrollController.jumpTo(52 * rowCount);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animatedcontroller.dispose();
  }

  void _selectYear(int year) {
    setState(() {
      _focusedDay = DateTime(year, _focusedDay.month, _focusedDay.day);
      isSelectedYear = true;
    });
  }

  _selectDay(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = selectedDay;
    });
  }

  _prevMonth(DateTime prevDateTime) {
    setState(() {
      _focusedDay = prevDateTime;
    });
  }

  _nextMonth(DateTime nextDateTime) {
    setState(() {
      _focusedDay = nextDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double fullWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Builder(
        builder: (context) {
          return SizedBox(
            width: fullWidth,
            child: Stack(
              children: [
                Positioned.fill(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                      width: fullWidth,
                      height: double.infinity,
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 57),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        color: pallete[Pallete.deepNavy],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/toggle_calendar_btn.svg',
                              ),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                            ),
                            Container(
                              width: 60,
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  alignment: Alignment.center,
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop(_focusedDay);
                                },
                                child: Text(
                                  '완료',
                                  style: types[Types.semi_lg]!.copyWith(
                                    color: pallete[Pallete.white],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned.fill(
                          child: Center(
                            child: Text(
                              DateFormat('yyyy.MM.dd').format(_focusedDay),
                              style: types[Types.semi_lg]!.copyWith(
                                color: pallete[Pallete.white],
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(height: 4),
                    if (isSelectedYear)
                      Container(
                        color: pallete[Pallete.alaskanBlue],
                        child: Calendar(
                          type: 'form',
                          selectedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          onDaySelected: _selectDay,
                          onPrevMonth: _prevMonth,
                          onNextMonth: _nextMonth,
                        ),
                      )
                    else
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 40,
                            alignment: Alignment.center,
                            color: pallete[Pallete.deepNavy],
                            child: Text(
                              'Years',
                              style: types[Types.semi_lg]!.copyWith(
                                color: pallete[Pallete.white],
                              ),
                            ),
                          ),
                          SizeTransition(
                            sizeFactor: _animatedcontroller,
                            child: Container(
                              width: fullWidth,
                              height: 52 * 6.0 + 32.0,
                              color: pallete[Pallete.alaskanBlue],
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 72,
                              ),
                              child: GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisExtent: 52,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 0,
                                ),
                                controller: _scrollController,
                                children: [
                                  for (final year in widget.years)
                                    SizedBox(
                                      height: 36,
                                      child: Center(
                                        child: TextButton(
                                          onPressed: () {
                                            _selectYear(year);
                                          },
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                year == _focusedDay.year
                                                    ? pallete[Pallete.deepNavy]
                                                    : pallete[Pallete.white],
                                            backgroundColor: year ==
                                                    _focusedDay.year
                                                ? pallete[Pallete.flash]
                                                : pallete[Pallete.alaskanBlue],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                          child: Text(
                                            '$year',
                                            style: types[Types.regular_md],
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
