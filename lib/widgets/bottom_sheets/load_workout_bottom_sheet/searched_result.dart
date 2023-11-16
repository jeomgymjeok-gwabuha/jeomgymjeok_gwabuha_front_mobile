import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/searched_result_item.dart';

class SerachedResult extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchedResultState();
  }
}

class _SearchedResultState extends State<SerachedResult> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 46,
          color: pallete[Pallete.deepNavy],
          padding: const EdgeInsets.only(left: 48, right: 52),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: Text(
                      '총세트',
                      style: types[Types.extra_sm]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 52,
                    child: Text(
                      '운동 이름',
                      style: types[Types.extra_sm]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      '최대 무게',
                      style: types[Types.extra_sm]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 60,
                    child: Text(
                      '최고 개수',
                      style: types[Types.extra_sm]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SearchedResultItem(),
            ],
          ),
        ),
        // Expanded(
        //   child: Center(
        //     child: Text(
        //       '일치하는 기록이 없습니다\n다시 검색해주세요.',
        //       textAlign: TextAlign.center,
        //       style: types[Types.semi_md]!
        //           .copyWith(color: pallete[Pallete.deepNavy]),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
