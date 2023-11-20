import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class WorkoutItemHeaderTitleBar extends StatefulWidget {
  const WorkoutItemHeaderTitleBar({
    super.key,
    required this.onTapHeader,
    required this.id,
    required this.name,
    required this.totalSetCount,
    required this.isExpanded,
    required this.isDisplayDeleteButton,
    required this.toggleDeleteBar,
    required this.groupValue,
    required this.reserveDeleteingWorkout,
    required this.isEditingMode,
  });

  final void Function() onTapHeader;
  final void Function(bool value) toggleDeleteBar;
  final void Function() reserveDeleteingWorkout;
  final String id;
  final String name;
  final int totalSetCount;
  final bool isExpanded;
  final bool isDisplayDeleteButton;
  final String groupValue;
  final bool isEditingMode;

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
      if (widget.isEditingMode) {
        return;
      }

      if (details.delta.dx > 0) {
        direction = 'right';
        return;
      }

      direction = 'left';
    }

    void _onHorizontalDragEnd(DragEndDetails details) {
      widget.toggleDeleteBar(direction == 'left');
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
                  padding: EdgeInsets.only(
                      left: widget.isEditingMode ? 22 : 51, right: 51),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          if (widget.isEditingMode)
                            Radio(
                              toggleable: true,
                              visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity,
                              ),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              fillColor: MaterialStateProperty.resolveWith(
                                (states) => widget.groupValue == widget.id
                                    ? pallete[Pallete.flash]
                                    : pallete[Pallete.white]!,
                              ),
                              value: widget.id,
                              groupValue: widget.groupValue,
                              onChanged: (value) {
                                setState(() {
                                  widget.reserveDeleteingWorkout();
                                });
                              },
                            ),
                          const SizedBox(width: 8),
                          Text(
                            widget.name,
                            style: types[Types.semi_lg]!.copyWith(
                              color: pallete[Pallete.white],
                            ),
                          ),
                        ],
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
