import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';
import 'package:jeomgymjeok_gwabuha/widgets/workout_item/index.dart';

class WorkoutList extends StatefulWidget {
  const WorkoutList({
    super.key,
    required this.list,
    required this.deleteWorkout,
    required this.deleteWorkoutList,
  });

  final List<MWorkoutItem> list;
  final void Function(String id) deleteWorkout;
  final void Function(List<String> ids) deleteWorkoutList;

  @override
  State<WorkoutList> createState() => _WorkoutListState();
}

class _WorkoutListState extends State<WorkoutList> {
  bool _isEditingMode = false;
  Map<String, String> deleteReservationList = {};

  void _openEditingMode() {
    setState(() {
      _isEditingMode = true;
    });
  }

  void _closeEditingMode() {
    setState(() {
      _isEditingMode = false;
      deleteReservationList = {};
    });
  }

  void _onDeleteWorkoutList() async {
    if (deleteReservationList.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('삭제를 위해 운동 기록을 선택해주세요.'),
        ),
      );
      return;
    }

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
      final ids = deleteReservationList.keys.toList();
      widget.deleteWorkoutList(ids);
      _closeEditingMode();
    }
  }

  void _onReserveDeleteingWorkout(String id) {
    if (deleteReservationList.containsKey(id)) {
      setState(() {
        deleteReservationList.remove(id);
      });
    } else {
      setState(() {
        deleteReservationList[id] = id;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.list.isNotEmpty) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 40,
            color: pallete[Pallete.deepNavy],
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: _isEditingMode
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: _onDeleteWorkoutList,
                        child: Text(
                          '삭제',
                          style: types[Types.semi_md]!.copyWith(
                            color: pallete[Pallete.red01],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: _closeEditingMode,
                        child: Text(
                          '취소',
                          style: types[Types.semi_md]!.copyWith(
                            color: pallete[Pallete.white],
                          ),
                        ),
                      ),
                    ],
                  )
                : TextButton(
                    onPressed: _openEditingMode,
                    child: Text(
                      '편집',
                      style: types[Types.semi_md]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: ListView.separated(
              itemCount: widget.list.length,
              itemBuilder: (context, index) => WorkoutItem(
                key: ValueKey(widget.list[index].id),
                workout: widget.list[index],
                deleteWorkout: widget.deleteWorkout,
                groupValue: deleteReservationList[widget.list[index].id] ?? '',
                reserveDeleteingWorkout: () =>
                    _onReserveDeleteingWorkout(widget.list[index].id),
                isEditingMode: _isEditingMode,
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 2,
              ),
            ),
          )
        ],
      );
    }

    return Center(
      child: Text(
        '근손실 예방이 필요합니다.',
        style: types[Types.extra_md]!.copyWith(
          color: pallete[Pallete.deepNavy],
        ),
      ),
    );
  }
}
