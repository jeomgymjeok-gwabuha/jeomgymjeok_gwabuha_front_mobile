import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_header_delete_bar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_header_title_bar.dart';

class WorkoutItemHeader extends StatefulWidget {
  const WorkoutItemHeader({
    super.key,
    required this.onTapHeader,
    required this.isExpanded,
    required this.id,
    required this.name,
    required this.totalSetCount,
    required this.isDisplayDeleteButton,
    required this.groupValue,
    required this.deleteWorkout,
    required this.reserveDeleteingWorkout,
    required this.toggleDeleteBar,
    required this.isEditingMode,
  });

  final void Function() onTapHeader;
  final bool isExpanded;
  final String id;
  final String name;
  final int totalSetCount;
  final bool isDisplayDeleteButton;
  final String groupValue;
  final bool isEditingMode;
  final void Function() deleteWorkout;
  final void Function() reserveDeleteingWorkout;
  final void Function(bool value) toggleDeleteBar;

  @override
  State<WorkoutItemHeader> createState() => _WorkoutItemHeaderState();
}

class _WorkoutItemHeaderState extends State<WorkoutItemHeader> {
  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: fullWidth,
      height: 80,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: WorkoutItemHeaderTitleBar(
              onTapHeader: widget.onTapHeader,
              id: widget.id,
              name: widget.name,
              totalSetCount: widget.totalSetCount,
              isExpanded: widget.isExpanded,
              isDisplayDeleteButton: widget.isDisplayDeleteButton,
              toggleDeleteBar: widget.toggleDeleteBar,
              groupValue: widget.groupValue,
              reserveDeleteingWorkout: widget.reserveDeleteingWorkout,
              isEditingMode: widget.isEditingMode,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: WorkoutItemHeaderDeleteBar(
              hidden: widget.isDisplayDeleteButton,
              toggleDeleteBar: widget.toggleDeleteBar,
              deleteWorkout: widget.deleteWorkout,
            ),
          )
        ],
      ),
    );
  }
}
