import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class WorkoutItemHeaderTitleBar extends StatefulWidget {
  const WorkoutItemHeaderTitleBar({
    super.key,
    required this.onTapHeader,
    required this.name,
    required this.totalSetCount,
    required this.isExpanded,
    required this.isDisplayDeleteButton,
    required this.toggleDeleteBar,
  });

  final void Function() onTapHeader;
  final void Function(bool value) toggleDeleteBar;
  final String name;
  final int totalSetCount;
  final bool isExpanded;
  final bool isDisplayDeleteButton;

  @override
  State<WorkoutItemHeaderTitleBar> createState() =>
      _WorkoutItemHeaderTitleBarState();
}

class _WorkoutItemHeaderTitleBarState extends State<WorkoutItemHeaderTitleBar> {
  String direction = '';

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;
    final double contentWidth =
        widget.isDisplayDeleteButton ? fullWidth - 80 : fullWidth;

    void _onHorizontalDragUpdate(DragUpdateDetails details) {
      if (details.delta.dx > 0) {
        direction = 'right';
        return;
      }

      direction = 'left';
    }

    void _onHorizontalDragEnd(DragEndDetails details) {
      widget.toggleDeleteBar(direction == 'right');
    }

    return GestureDetector(
      onTap: widget.onTapHeader,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
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
            if (!widget.isDisplayDeleteButton)
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
    );
  }
}
