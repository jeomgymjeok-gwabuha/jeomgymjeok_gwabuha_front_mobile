import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

List<int> years = [
  2011,
  2022,
  2013,
  2014,
  2015,
  2016,
  2017,
  2018,
  2019,
  2020,
  2021,
  2022,
  2023,
  2024,
  2025,
  2026,
  2027,
  2028
];

class YearSelector extends StatelessWidget {
  const YearSelector({super.key});

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
              height: 52 * (years.length / 3).toDouble() + 32.0,
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
                children: [
                  for (final year in years)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: pallete[Pallete.alaskanBlue],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            year.toString(),
                            style: types[Types.regular_md]!.copyWith(
                              color: pallete[Pallete.white],
                            ),
                          ),
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
