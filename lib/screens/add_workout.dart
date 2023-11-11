import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';
import 'package:jeomgymjeok_gwabuha/widgets/date_selector.dart';
import 'package:jeomgymjeok_gwabuha/widgets/set_table/index.dart';

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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = TextEditingController();
  bool _invalidWorkoutName = false;

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
            onPressed: () {
              _formKey.currentState!.validate();
            },
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
          child: Form(
            key: _formKey,
            child: Stack(
              children: [
                DateSelector(
                  selectedDay: _recordDate,
                  start: 2000,
                  end: 2100,
                  changeDate: _changeRecordDate,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          labelText: '운동 이름',
                          labelStyle: types[Types.semi_md]!.copyWith(
                              color: _invalidWorkoutName
                                  ? pallete[Pallete.red01]
                                  : pallete[Pallete.deepNavy]),
                          errorStyle: types[Types.input_helper]!
                              .copyWith(color: pallete[Pallete.red01]),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: pallete[Pallete.deepNavy]!,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: pallete[Pallete.deepNavy]!,
                              width: 2,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: pallete[Pallete.red01]!,
                              width: 2,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: pallete[Pallete.red01]!,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        style: types[Types.semi_md]!.copyWith(
                          color: pallete[Pallete.deepNavy],
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            setState(() {
                              _invalidWorkoutName = true;
                            });
                            return '운동명을 입력해 주세요.';
                          }

                          setState(() {
                            _invalidWorkoutName = false;
                          });
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),
                      Container(
                        alignment: Alignment.centerRight,
                        child: TextBtn(
                          text: '기록 불러오기',
                          onPressed: () {},
                          width: 140,
                          height: 32,
                          borderRadius: 4,
                        ),
                      ),
                      const SetTable(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
