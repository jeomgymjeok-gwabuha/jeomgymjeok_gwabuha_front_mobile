import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class LoadWorkoutTitlebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
    );
  }
}
