import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class SetTable extends StatelessWidget {
  const SetTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 24, right: 40),
          child: Text(
            'Set',
            style: types[Types.semi_lg]!.copyWith(
              color: pallete[Pallete.alaskanBlue],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          color: pallete[Pallete.deepNavy],
          padding:
              const EdgeInsets.only(left: 52, right: 32, top: 12, bottom: 12),
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  '세트',
                  style: types[Types.semi_md]!.copyWith(
                    color: pallete[Pallete.white],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 112,
                child: Text(
                  '무게',
                  style: types[Types.semi_md]!.copyWith(
                    color: pallete[Pallete.white],
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Text(
                  '갯수',
                  style: types[Types.semi_md]!.copyWith(
                    color: pallete[Pallete.white],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
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
        ),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(('assets/icons/white_union.svg')),
            style: ElevatedButton.styleFrom(
              backgroundColor: pallete[Pallete.deepNavy],
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 0,
            ),
            label: Text(
              '추가',
              style: types[Types.semi_md]!.copyWith(
                color: pallete[Pallete.white],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
