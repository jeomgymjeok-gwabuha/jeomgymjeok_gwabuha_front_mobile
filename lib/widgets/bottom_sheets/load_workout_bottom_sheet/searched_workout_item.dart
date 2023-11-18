import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/horizontal_dotted_divider.dart';

class SearchedWorkoutItem extends StatefulWidget {
  const SearchedWorkoutItem({
    super.key,
    required this.id,
    required this.name,
    required this.dateTime,
    required this.selectedWorkoutItemId,
    required this.set,
    required this.selectWorkoutItemId,
  });

  final String id;
  final String name;
  final String dateTime;
  final String selectedWorkoutItemId;
  final List<MWorkoutSet> set;
  final void Function(String id) selectWorkoutItemId;

  @override
  State<StatefulWidget> createState() {
    return _SearchedWorkoutItemState();
  }
}

class _SearchedWorkoutItemState extends State<SearchedWorkoutItem>
    with SingleTickerProviderStateMixin {
  final key = GlobalKey();

  late AnimationController _animationController;
  late Animation<double> _heightFactor;

  String test = 'a';
  bool _showSetTable = false;

  @override
  void initState() {
    // TODO: implement initState
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

  void _toggleSetTable() {
    setState(() {
      _showSetTable = !_showSetTable;
      if (_showSetTable) {
        _animationController.forward().whenComplete(() {
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 200),
          );
        });
      } else {
        _animationController.reverse();
      }
    });
  }

  get parsedDateTime {
    return DateFormat('yyyy.MM.dd EEEE', 'ko_KR')
        .format(DateFormat('yyyy.MM.dd').parse(widget.dateTime));
  }

  get maxWeight {
    return widget.set.map((el) => el.weight).toList().reduce(max);
  }

  get maxCount {
    return widget.set.map((el) => el.count).toList().reduce(max);
  }

  Widget setTableRow(MWorkoutSet setItem, int index) {
    return Container(
      padding: const EdgeInsets.only(
        left: 44,
        right: 52,
        top: 12,
        bottom: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            decoration: BoxDecoration(
              color: pallete[Pallete.flash],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '${index + 1}Set',
              style: types[Types.semi_sm]!.copyWith(
                color: pallete[Pallete.deepNavy],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  '${setItem.weight}kg',
                  style: types[Types.regular_sm]!
                      .copyWith(color: pallete[Pallete.alaskanBlue]!),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 60,
                child: Text(
                  '${setItem.count}개',
                  style: types[Types.regular_sm]!
                      .copyWith(color: pallete[Pallete.alaskanBlue]!),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: pallete[Pallete.deepNavy]!),
            ),
          ),
          child: Stack(
            children: [
              GestureDetector(
                onTap: _toggleSetTable,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 44,
                    right: 16,
                    top: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: pallete[Pallete.flash],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${widget.set.length}Set',
                          style: types[Types.semi_sm]!.copyWith(
                            color: pallete[Pallete.deepNavy],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              parsedDateTime,
                              style: types[Types.semi_sm]!.copyWith(
                                color: pallete[Pallete.alaskanBlue],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: types[Types.semi_lg]!.copyWith(
                                      color: pallete[Pallete.deepNavy],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 60,
                                  child: Text(
                                    '${maxWeight}kg',
                                    style: types[Types.semi_lg]!.copyWith(
                                      color: pallete[Pallete.deepNavy],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SizedBox(
                                  width: 60,
                                  child: Text(
                                    '${maxCount}개',
                                    style: types[Types.semi_lg]!.copyWith(
                                      color: pallete[Pallete.deepNavy],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                SvgPicture.asset(
                                    'assets/icons/chevron_down.svg'),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 16,
                child: Radio(
                    visualDensity: const VisualDensity(
                      horizontal: VisualDensity.minimumDensity,
                      vertical: VisualDensity.minimumDensity,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    focusColor: pallete[Pallete.blue]!,
                    value: widget.id,
                    groupValue: widget.selectedWorkoutItemId,
                    onChanged: (value) {
                      widget.selectWorkoutItemId(value!);
                    }),
              ),
            ],
          ),
        ),
        SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: _heightFactor,
            child: Column(
              key: key,
              children: List.generate(
                widget.set.length,
                (index) => Column(children: [
                  setTableRow(widget.set[index], index),
                  const SizedBox(
                    width: double.infinity,
                    height: 1,
                    child: HorizontalDottedDivider(thickness: 1.0, length: 4.0),
                  ),
                ]),
              ),
            )),
      ],
    );
  }
}
