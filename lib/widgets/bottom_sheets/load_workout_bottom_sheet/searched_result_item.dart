import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class SearchedResultItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchedResultItemState();
  }
}

class _SearchedResultItemState extends State<SearchedResultItem> {
  String test = 'a';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      child: Row(
        children: [
          Radio(
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            focusColor: pallete[Pallete.blue]!,
            value: 'a',
            groupValue: test,
            onChanged: (r) {
              setState(() {
                test = r!;
              });
            },
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: pallete[Pallete.flash],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '3Set',
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.deepNavy],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2023.10.23 월요일',
                  style: types[Types.semi_sm]!.copyWith(
                    color: pallete[Pallete.alaskanBlue],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '데드리프트',
                        style: types[Types.semi_lg]!.copyWith(
                          color: pallete[Pallete.deepNavy],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 60,
                      child: Text(
                        '15kg',
                        style: types[Types.semi_lg]!.copyWith(
                          color: pallete[Pallete.deepNavy],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 60,
                      child: Text(
                        '15개',
                        style: types[Types.semi_lg]!.copyWith(
                          color: pallete[Pallete.deepNavy],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SvgPicture.asset('assets/icons/chevron_down.svg'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
