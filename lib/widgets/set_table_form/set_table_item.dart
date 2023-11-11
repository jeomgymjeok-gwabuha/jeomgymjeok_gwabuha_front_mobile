import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/models/m_set_table_form_item.dart';

class setTableItem extends StatelessWidget {
  const setTableItem({
    super.key,
    required this.sequence,
    required this.item,
    required this.isGeneratedWidgetError,
    required this.isGeneratedCountError,
    required this.removeSetTableRow,
  });

  final int sequence;
  final MSetTableFormItem item;
  final bool isGeneratedWidgetError;
  final bool isGeneratedCountError;
  final void Function() removeSetTableRow;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: removeSetTableRow,
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
              '${sequence}Set',
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.deepNavy],
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            child: TextField(
              controller: item.weightController,
              keyboardType: TextInputType.number,
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.alaskanBlue],
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                hintText: "-",
                hintStyle: types[Types.semi_sm]!.copyWith(
                  color: isGeneratedWidgetError
                      ? pallete[Pallete.red01]!
                      : pallete[Pallete.alaskanBlue]!,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: isGeneratedWidgetError
                        ? pallete[Pallete.red01]!
                        : pallete[Pallete.alaskanBlue]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: isGeneratedWidgetError
                        ? pallete[Pallete.red01]!
                        : pallete[Pallete.alaskanBlue]!,
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
            child: TextField(
              controller: item.countController,
              keyboardType: TextInputType.number,
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.alaskanBlue],
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                hintText: "-",
                hintStyle: types[Types.semi_sm]!.copyWith(
                  color: isGeneratedCountError
                      ? pallete[Pallete.red01]!
                      : pallete[Pallete.alaskanBlue]!,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: isGeneratedCountError
                        ? pallete[Pallete.red01]!
                        : pallete[Pallete.alaskanBlue]!,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: isGeneratedCountError
                        ? pallete[Pallete.red01]!
                        : pallete[Pallete.alaskanBlue]!,
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
