import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/dialogs/select_year_dialog.dart';

class YearSelector extends StatefulWidget {
  YearSelector({
    super.key,
    required this.selectedDay,
    required this.start,
    required this.end,
    required this.changeYear,
  });

  final int start;
  final int end;
  final DateTime selectedDay;
  void Function(int value) changeYear;

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedcontroller;
  late List<int> years = [];

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
    return Column(
      children: [
        Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: pallete[Pallete.deepNavy],
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
                        onPressed: () async {
                          var response = await showDialog(
                            context: context,
                            builder: (context) {
                              return SelectYearDialog(
                                selectedDay: widget.selectedDay,
                                years: years,
                              );
                            },
                          );

                          if (response != null && response is int) {
                            widget.changeYear(response);
                          }
                        },
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
    );
  }
}
