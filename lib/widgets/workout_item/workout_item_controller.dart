import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';

class WorkoutController extends StatefulWidget {
  const WorkoutController({
    super.key,
    required this.deleteWorkout,
    required this.editWorkout,
  });

  final void Function() deleteWorkout;
  final void Function() editWorkout;

  @override
  State<WorkoutController> createState() => _WorkoutControllerState();
}

class _WorkoutControllerState extends State<WorkoutController> {
  void onClickDeleteBtn() async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        final double paddingBottom = Platform.isIOS ? 120 : 104;

        return AlertDialog(
          insetPadding: EdgeInsets.only(
            top: 0,
            bottom: paddingBottom,
            left: 0,
            right: 0,
          ),
          backgroundColor: Colors.transparent,
          alignment: Alignment.bottomCenter,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          content: Builder(
            builder: (context) {
              final width = MediaQuery.of(context).size.width;

              return IntrinsicHeight(
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: 128,
                        decoration: BoxDecoration(
                          color: pallete[Pallete.deepNavy],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  '해당 운동 기록을 삭제하시겠습니까?',
                                  style: types[Types.semi_md]!.copyWith(
                                    color: pallete[Pallete.white],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: width,
                              height: 0.5,
                              color: pallete[Pallete.white]!.withOpacity(0.24),
                            ),
                            TextBtn(
                                text: '삭제',
                                width: width,
                                height: 52,
                                textColor: Pallete.red01,
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextBtn(
                        text: '취소',
                        width: width,
                        height: 52,
                        textColor: Pallete.flash,
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );

    if (result != null && result == true) {
      widget.deleteWorkout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pallete[Pallete.alaskanBlue],
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 29, bottom: 40, left: 12, right: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: onClickDeleteBtn,
                      style: ElevatedButton.styleFrom(
                          foregroundColor: pallete[Pallete.white],
                          backgroundColor: pallete[Pallete.red02],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          )),
                      child: Text(
                        '삭제',
                        style: types[Types.semi_md],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 28),
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        print('수정!');
                        widget.editWorkout();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: pallete[Pallete.white],
                        backgroundColor: pallete[Pallete.deepNavy],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        '수정',
                        style: types[Types.semi_md],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 2,
              child: Container(
                width: 82,
                height: 2,
                decoration: BoxDecoration(
                  color: pallete[Pallete.white],
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
