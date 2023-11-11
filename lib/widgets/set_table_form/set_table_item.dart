import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class setTableItem extends StatelessWidget {
  const setTableItem({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SvgPicture.asset('assets/icons/cancel.svg'),
          ),
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
              '1Set',
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.deepNavy],
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            height: 24,
            child: TextField(
              keyboardType: TextInputType.number,
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.alaskanBlue],
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: Center(
                  child: Text(
                    "-",
                    style: types[Types.semi_sm]!.copyWith(
                      color: pallete[Pallete.deepNavy],
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: pallete[Pallete.alaskanBlue]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: pallete[Pallete.alaskanBlue]!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'kg',
            style: types[Types.semi_sm]!.copyWith(
              color: pallete[Pallete.deepNavy],
            ),
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: 80,
            height: 24,
            child: TextField(
              keyboardType: TextInputType.number,
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.alaskanBlue],
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                label: Center(
                  child: Text(
                    "-",
                    style: types[Types.semi_sm]!.copyWith(
                      color: pallete[Pallete.deepNavy],
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: pallete[Pallete.alaskanBlue]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: pallete[Pallete.alaskanBlue]!,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '개',
            style: types[Types.semi_sm]!.copyWith(
              color: pallete[Pallete.deepNavy],
            ),
          ),
        ],
      ),
    );
  }
}
