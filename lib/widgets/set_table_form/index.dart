import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/set_table_form/set_table_item.dart';

class SetTableForm extends StatelessWidget {
  const SetTableForm({super.key});

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
        setTableItem(),
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
