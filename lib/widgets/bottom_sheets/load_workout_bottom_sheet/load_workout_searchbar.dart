import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/providers/workout_provider.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_sheets/load_workout_bottom_sheet/date_picker.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';
import 'package:jeomgymjeok_gwabuha/widgets/vertical_dotted_divider.dart';

const List<String> options = ['entire', 'select'];

class LoadWorkoutSearchbar extends ConsumerStatefulWidget {
  const LoadWorkoutSearchbar({super.key});

  @override
  ConsumerState<LoadWorkoutSearchbar> createState() =>
      _LoadWorkoutSearchbarState();
}

class _LoadWorkoutSearchbarState extends ConsumerState<LoadWorkoutSearchbar> {
  String selectedOption = options.first;
  DateTime startTime = DateTime.now();
  DateTime lastTime = DateTime.now();

  void changeStartTime(DateTime dateTime) {
    setState(() {
      startTime = dateTime;
    });
  }

  void changeLastTime(DateTime dateTime) {
    setState(() {
      lastTime = dateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double fullWidth = MediaQuery.of(context).size.width;
    final names = ref.watch(workoutNames);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              children: [
                Text(
                  '운동 검색',
                  style: types[Types.semi_md]!.copyWith(
                    color: pallete[Pallete.deepNavy],
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SearchAnchor(
            viewConstraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
            viewHintText: '운동 이름을 검색해주세요.',
            headerTextStyle: types[Types.semi_md]!.copyWith(
              color: pallete[Pallete.alaskanBlue],
            ),
            builder: (context, controller) {
              return SearchBar(
                controller: controller,
                textStyle: MaterialStateProperty.resolveWith(
                  (states) => types[Types.semi_md]!
                      .copyWith(color: pallete[Pallete.alaskanBlue]!),
                ),
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  );
                }),
                side: MaterialStateProperty.resolveWith((states) {
                  return BorderSide(
                    width: 1,
                    color: pallete[Pallete.deepNavy]!,
                  );
                }),
                hintText: '운동 이름을 검색해주세요.',
                hintStyle: MaterialStateProperty.resolveWith(
                  (states) => types[Types.semi_md]!.copyWith(
                    color: pallete[Pallete.alaskanBlue],
                  ),
                ),
                constraints: const BoxConstraints(
                  minHeight: 44,
                  maxHeight: 44,
                ),
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 8),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: SvgPicture.asset('assets/icons/search.svg'),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              return List<ListTile>.generate(names.length, (int index) {
                return ListTile(
                  title: Text(names[index]),
                  onTap: () {
                    setState(() {
                      controller.closeView(names[index]);
                    });
                  },
                );
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              alignment: Alignment.center,
              isExpanded: true,
              isDense: false,
              items: options
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item == 'entire' ? '기간 전체' : '기간 직접 입력',
                          style: types[Types.semi_md]!.copyWith(
                            color: pallete[Pallete.alaskanBlue],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedOption,
              onChanged: (String? value) {
                setState(() {
                  selectedOption = value!;
                });
              },
              buttonStyleData: ButtonStyleData(
                height: 44,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 40, right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: pallete[Pallete.deepNavy]!,
                  ),
                ),
                elevation: 0,
              ),
              iconStyleData: IconStyleData(
                icon: SvgPicture.asset('assets/icons/chevron_down.svg'),
              ),
              dropdownStyleData: DropdownStyleData(
                width: fullWidth - 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                elevation: 2,
                offset: const Offset(0, -1),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
                padding: EdgeInsets.zero,
                scrollPadding: EdgeInsets.zero,
              ),
              menuItemStyleData: MenuItemStyleData(
                height: 44,
                padding: const EdgeInsets.only(left: 40, right: 12),
                selectedMenuItemBuilder: (ctx, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: pallete[Pallete.deepNavy],
                    ),
                    height: 44,
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 12,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text(
                      selectedOption == 'entire' ? '기간 전체' : '기간 직접 입력',
                      style: types[Types.semi_md]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (selectedOption == 'select')
            Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: DatePicker(
                        initialTime: startTime,
                        changeDateTime: changeStartTime,
                      ),
                    ),
                    SizedBox(
                      width: 32,
                      height: 40,
                      child: Center(
                        child: Container(
                            width: 8,
                            height: 1,
                            color: pallete[Pallete.deepNavy]!),
                      ),
                    ),
                    Expanded(
                      child: DatePicker(
                        initialTime: lastTime,
                        changeDateTime: changeLastTime,
                      ),
                    )
                  ],
                ),
              ],
            ),
          const SizedBox(height: 12),
          TextBtn(
            text: '검색하기',
            onPressed: () {},
            width: double.infinity,
            height: 56,
          ),
        ],
      ),
    );
  }
}
