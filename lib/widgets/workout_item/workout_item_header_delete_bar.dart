import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';

class WorkoutItemHeaderDeleteBar extends StatefulWidget {
  const WorkoutItemHeaderDeleteBar({
    super.key,
    required this.hidden,
    required this.toggleDeleteBar,
    required this.deleteWorkout,
  });

  final bool hidden;
  final void Function(bool value) toggleDeleteBar;
  final void Function() deleteWorkout;

  @override
  State<WorkoutItemHeaderDeleteBar> createState() =>
      _WorkoutItemHeaderDeleteBarState();
}

class _WorkoutItemHeaderDeleteBarState
    extends State<WorkoutItemHeaderDeleteBar> {
  double buttonWidth = 80;

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    void _onHorizontalDragUpdate(DragUpdateDetails details) {
      if (details.delta.dx < 0) {
        setState(() {
          buttonWidth = fullWidth;
        });
      }
    }

    void _onHorizontalDragEnd(DragEndDetails details) async {
      if (buttonWidth > fullWidth * 0.7) {
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
                                  color:
                                      pallete[Pallete.white]!.withOpacity(0.24),
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
          widget.toggleDeleteBar(false);
        }
      }

      setState(() {
        buttonWidth = 80;
      });
    }

    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        width: widget.hidden ? buttonWidth : 0,
        height: 80,
        color: pallete[Pallete.red02],
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SvgPicture.asset('assets/icons/white_trash.svg'),
        ),
      ),
    );
  }
}
