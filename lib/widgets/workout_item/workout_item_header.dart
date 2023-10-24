import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_header_delete_bar.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_header_title_bar.dart';

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

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    void _toggleDeleteBar(bool value) {
      setState(() {
        isDisplayDeleteButton = value;
      });
    }

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
              name: widget.name,
              totalSetCount: widget.totalSetCount,
              isExpanded: widget.isExpanded,
              isDisplayDeleteButton: isDisplayDeleteButton,
              toggleDeleteBar: _toggleDeleteBar,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: WorkoutItemHeaderDeleteBar(
              hidden: isDisplayDeleteButton,
            ),
          )
        ],
      ),
    );
  }
}
