import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_content.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/workout_item_header.dart';

class WorkoutItem extends StatefulWidget {
  const WorkoutItem({
    super.key,
    required this.workout,
    required this.deleteWorkout,
    required this.reserveDeleteingWorkout,
    required this.groupValue,
    required this.isEditingMode,
    required this.editWorkout,
  });

  final MWorkoutItem workout;
  final void Function(String id) deleteWorkout;
  final void Function() reserveDeleteingWorkout;
  final String groupValue;
  final bool isEditingMode;
  final void Function() editWorkout;

  @override
  State<WorkoutItem> createState() => _WorkoutItemState();
}

class _WorkoutItemState extends State<WorkoutItem>
    with SingleTickerProviderStateMixin {
  var _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _heightFactor;
  bool _isDisplayDeleteButton = false;

  void _onTapHeader() {
    setState(() {
      _isExpanded = !_isExpanded;

      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  void _toggleDeleteBar(bool value) {
    setState(() {
      _isDisplayDeleteButton = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 150,
      ),
    );
    _heightFactor = _animationController.drive(Tween(begin: 0.0, end: 1.0));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WorkoutItemHeader(
          isExpanded: _isExpanded,
          id: widget.workout.id,
          name: widget.workout.name,
          totalSetCount: widget.workout.set.length,
          onTapHeader: _onTapHeader,
          isDisplayDeleteButton: _isDisplayDeleteButton,
          toggleDeleteBar: _toggleDeleteBar,
          deleteWorkout: () => widget.deleteWorkout(widget.workout.id),
          groupValue: widget.groupValue,
          reserveDeleteingWorkout: widget.reserveDeleteingWorkout,
          isEditingMode: widget.isEditingMode,
        ),
        WorkoutItemContent(
          heightFactor: _heightFactor,
          id: widget.workout.id,
          name: widget.workout.name,
          set: widget.workout.set,
          deleteWorkout: () => widget.deleteWorkout(widget.workout.id),
          editWorkout: widget.editWorkout,
        ),
      ],
    );
  }
}
