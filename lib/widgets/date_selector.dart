import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/dialogs/select_date_dialog.dart';

// ignore: must_be_immutable
class DateSelector extends StatefulWidget {
  DateSelector({
    super.key,
    required this.selectedDay,
    required this.start,
    required this.end,
    required this.changeDate,
  });

  final int start;
  final int end;
  final DateTime selectedDay;
  void Function(DateTime date) changeDate;

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedcontroller;
  late List<int> years = [];

  void _openSelectDate() async {
    var response = await showDialog(
      context: context,
      builder: (context) {
        return SelectDateDialog(
          selectedDay: widget.selectedDay,
          years: years,
        );
      },
    );

    if (response != null && response is DateTime) {
      widget.changeDate(response);
    }
  }

  @override
  void initState() {
    super.initState();

    years = List.generate(
      widget.end - widget.start + 1,
      (index) => index + widget.start,
    );

    _animatedcontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animatedcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: pallete[Pallete.deepNavy],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: _openSelectDate,
                          icon: SvgPicture.asset(
                            'assets/icons/toggle_calendar_btn.svg',
                          ),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        DateFormat('yyyy.MM.dd').format(widget.selectedDay),
                        style: types[Types.semi_lg]!.copyWith(
                          color: pallete[Pallete.white],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
