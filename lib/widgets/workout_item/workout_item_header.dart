import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class WorkoutItemHeader extends StatefulWidget {
  const WorkoutItemHeader({
    super.key,
    required this.onTapHeader,
    required this.isExpanded,
    required this.name,
    required this.totalSetCount,
  });

  final void Function() onTapHeader;
  final bool isExpanded;
  final String name;
  final int totalSetCount;

  @override
  State<WorkoutItemHeader> createState() => _WorkoutItemHeaderState();
}

class _WorkoutItemHeaderState extends State<WorkoutItemHeader> {
  bool isDisplayDeleteButton = false;
  String direction = '';
  double buttonWidth = 80;

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;
    final double contentWidth =
        isDisplayDeleteButton ? fullWidth - 80 : fullWidth;

    return SizedBox(
      width: fullWidth,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: widget.onTapHeader,
              onHorizontalDragUpdate: (details) => {
                if (details.delta.dx > 0)
                  {direction = 'right'}
                else
                  {direction = 'left'}
              },
              onHorizontalDragEnd: (details) {
                setState(() {
                  isDisplayDeleteButton = direction == 'right';
                });
              },
              child: Container(
                width: fullWidth,
                height: 80,
                color: pallete[Pallete.alaskanBlue],
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: AnimatedContainer(
                          width: contentWidth,
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.easeInOut,
                          height: 80,
                          padding: const EdgeInsets.only(left: 52, right: 51),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                widget.name,
                                style: types[Types.semi_lg]!.copyWith(
                                  color: pallete[Pallete.white],
                                ),
                              ),
                              Text(
                                '${widget.totalSetCount}Set',
                                style: types[Types.semi_lg]!.copyWith(
                                  color: pallete[Pallete.white],
                                ),
                              ),
                            ],
                          )),
                    ),
                    if (!isDisplayDeleteButton)
                      Positioned(
                        left: 0,
                        bottom: 8,
                        child: Container(
                          width: fullWidth,
                          height: 2,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: AnimatedContainer(
                            width: widget.isExpanded ? fullWidth : 82,
                            height: 2,
                            duration: const Duration(milliseconds: 150),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: widget.isExpanded
                                  ? pallete[Pallete.deepNavy]!.withOpacity(0.5)
                                  : pallete[Pallete.white],
                              borderRadius: BorderRadius.circular(9999),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (details.delta.dx < 0) {
                  setState(() {
                    buttonWidth = min(
                        buttonWidth - (details.primaryDelta! * 2), fullWidth);
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                if (buttonWidth > fullWidth * 0.7) {
                  // To display notification to question delete
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                width: isDisplayDeleteButton ? buttonWidth : 0,
                height: 80,
                color: pallete[Pallete.red02],
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: SvgPicture.asset('assets/icons/white_trash.svg'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
