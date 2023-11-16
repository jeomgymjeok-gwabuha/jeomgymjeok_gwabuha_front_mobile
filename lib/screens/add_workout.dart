import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/models/m_set_table_form_item.dart';
import 'package:jeomgymjeok_gwabuha/models/m_workout_item.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/index.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';
import 'package:jeomgymjeok_gwabuha/widgets/date_selector.dart';
import 'package:jeomgymjeok_gwabuha/widgets/set_table_form/index.dart';

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
  bool _invalidWorkoutName = false;
  Map<String, MSetTableFormItem> _invalidSetTable = {};

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final List<MSetTableFormItem> _setTableForm = [
    MSetTableFormItem(
      weightController: TextEditingController(),
      countController: TextEditingController(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _recordDate = widget.selectedDay;
  }

  void _addSetTableRow() {
    setState(() {
      _setTableForm.add(
        MSetTableFormItem(
          weightController: TextEditingController(),
          countController: TextEditingController(),
        ),
      );
    });
  }

  void _removeSetTableRow(int index) {
    setState(() {
      _setTableForm.removeAt(index);
    });
  }

  void _changeRecordDate(DateTime date) {
    setState(() {
      _recordDate = date;
    });
  }

  void _openRecordingBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        builder: (BuildContext context) {
          final fullHeight = MediaQuery.of(context).size.height;

          return SizedBox(
            height: fullHeight * 0.75,
            child: const LoadWorkoutBottomSheet(),
          );
        });
  }

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      setState(() {
        _invalidSetTable = {};
      });
      return;
    }

    List<MSetTableFormItem> invalidsetTableForm = _setTableForm
        .where((el) => el.isCountEmpty || el.isWeightEmpty)
        .toList();

    if (invalidsetTableForm.isNotEmpty) {
      setState(() {
        _invalidSetTable = {
          for (var item in invalidsetTableForm) item.id: item
        };
      });
      return;
    }

    final List<MWorkoutSet> set = _setTableForm.asMap().entries.map((entry) {
      int sequence = entry.key + 1;
      int weight = int.parse(entry.value.weightController.text);
      int count = int.parse(entry.value.countController.text);

      return MWorkoutSet(sequence: sequence, weight: weight, count: count);
    }).toList();

    String name = _nameController.text;
    final MWorkoutItem newWorkoutItem = MWorkoutItem(name: name, set: set);
    final String recordDate = DateFormat('yyyy.MM.dd').format(_recordDate);

    Navigator.of(context).pop({
      'recordDate': recordDate,
      'newWorkoutItem': newWorkoutItem,
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
            onPressed: _submit,
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
                SizedBox(
                  height: double.infinity - 41,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 24, right: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          TextFormField(
                            controller: _nameController,
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
                              onPressed: _openRecordingBottomSheet,
                              width: 140,
                              height: 32,
                              borderRadius: 4,
                            ),
                          ),
                          SetTableForm(
                            formData: _setTableForm,
                            invalidSetTable: _invalidSetTable,
                            addSetTableRow: _addSetTableRow,
                            removeSetTableRow: _removeSetTableRow,
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
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
