import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/date_selector.dart';

class AddWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        centerTitle: true,
        backgroundColor: pallete[Pallete.deepNavy],
        title: Text(
          '운동 기록',
          style: types[Types.semi_lg]!.copyWith(
            color: pallete[Pallete.white],
          ),
        ),
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: SvgPicture.asset('assets/icons/close.svg'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '완료',
              style: types[Types.semi_lg]!.copyWith(
                color: pallete[Pallete.white],
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            DateSelector(
                selectedDay: DateTime.now(),
                start: 2000,
                end: 2100,
                changeYear: (value) {
                  print(value);
                })
          ],
        ),
      ),
    );
  }
}
