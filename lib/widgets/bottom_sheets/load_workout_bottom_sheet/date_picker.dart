import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/vertical_dotted_divider.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.initialTime,
    required this.changeDateTime,
  });

  final DateTime initialTime;
  final void Function(DateTime dateTime) changeDateTime;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () async {
        var response = await showDatePicker(
          context: context,
          initialDate: initialTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(3000),
        );

        if (response is DateTime) {
          changeDateTime(response);
        }
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: pallete[Pallete.deepNavy]!,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/date_picker.svg',
                ),
              ),
            ),
            SizedBox(
              width: 1,
              height: 40,
              child: VerticalDottedDivider(
                color: pallete[Pallete.deepNavy]!,
                length: 3,
                thickness: 0.5,
                indent: 3,
                endIndent: 3,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  DateFormat('yyyy.MM.dd').format(initialTime),
                  style: types[Types.semi_lg]!.copyWith(
                    color: pallete[Pallete.deepNavy]!,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
