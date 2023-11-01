import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class YearSelector extends StatefulWidget {
  YearSelector({
    super.key,
    required this.value,
    required this.start,
    required this.end,
    required this.changeYear,
  });

  final int value;
  final int start;
  final int end;
  void Function(int value) changeYear;

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  final ScrollController _scrollController = ScrollController();
  late List<int> years = [];

  @override
  void initState() {
    super.initState();

    years = List.generate(
      widget.end - widget.start + 1,
      (index) => index + widget.start,
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final foundIndex = years.indexWhere((element) => element == widget.value);
      final rowCount = (foundIndex ~/ 3).toDouble();
      _scrollController.jumpTo(52 * rowCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

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
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/toggle_calendar_btn.svg',
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      DateFormat('yyyy.MM.dd').format(DateTime.now()),
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
        Column(
          children: [
            const SizedBox(height: 4),
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
            Container(
              width: fullWidth,
              height: 52 * 6.0 + 32.0,
              color: pallete[Pallete.alaskanBlue],
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 72,
              ),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 52,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 0,
                ),
                controller: _scrollController,
                children: [
                  for (final year in years)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          widget.changeYear(year);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: year == widget.value
                              ? pallete[Pallete.deepNavy]
                              : pallete[Pallete.white],
                          backgroundColor: year == widget.value
                              ? pallete[Pallete.flash]
                              : pallete[Pallete.alaskanBlue],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          '$year',
                          style: types[Types.regular_md],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
