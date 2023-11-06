import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/date_selector.dart';

class AddWorkout extends StatefulWidget {
  const AddWorkout({
    super.key,
    required this.selectedDay,
  });

  final DateTime selectedDay;

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  late DateTime _recordDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _recordDate = widget.selectedDay;
  }

  void _changeRecordDate(DateTime date) {
    setState(() {
      _recordDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        centerTitle: true,
        backgroundColor: pallete[Pallete.deepNavy],
        title: Text(
          '운동 기록',
          style: types[Types.semi_lg]!.copyWith(
            color: pallete[Pallete.white],
          ),
        ),
        leading: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: SvgPicture.asset('assets/icons/close.svg'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '완료',
              style: types[Types.semi_lg]!.copyWith(
                color: pallete[Pallete.white],
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Stack(
            children: [
              DateSelector(
                selectedDay: _recordDate,
                start: 2000,
                end: 2100,
                changeDate: _changeRecordDate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
