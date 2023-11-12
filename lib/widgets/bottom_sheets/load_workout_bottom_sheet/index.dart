import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class LoadWorkoutBottomSheet extends StatelessWidget {
  const LoadWorkoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 40,
          color: pallete[Pallete.deepNavy],
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Text(
                    '운동기록 불러오기',
                    style: types[Types.semi_lg]!.copyWith(
                      color: pallete[Pallete.white],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/close.svg'),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              Text(
                '운동 검색',
                style: types[Types.semi_md]!.copyWith(
                  color: pallete[Pallete.deepNavy],
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
