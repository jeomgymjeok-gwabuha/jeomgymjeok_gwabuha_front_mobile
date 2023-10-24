import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';

class WorkoutItemDeleteGesture extends StatefulWidget {
  const WorkoutItemDeleteGesture({
    super.key,
    required this.hidden,
  });

  final bool hidden;

  @override
  State<WorkoutItemDeleteGesture> createState() =>
      _WorkoutItemDeleteGestureState();
}

class _WorkoutItemDeleteGestureState extends State<WorkoutItemDeleteGesture> {
  double buttonWidth = 80;

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    void _onHorizontalDragUpdate(DragUpdateDetails details) {
      if (details.delta.dx < 0) {
        setState(() {
          buttonWidth =
              min(buttonWidth - (details.primaryDelta! * 2), fullWidth);
        });
      }
    }

    void _onHorizontalDragEnd(DragEndDetails details) {
      if (buttonWidth > fullWidth * 0.7) {
        // To display notification to question delete
      }
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
