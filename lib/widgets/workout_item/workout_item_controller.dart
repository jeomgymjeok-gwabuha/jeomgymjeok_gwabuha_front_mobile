import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class WorkoutController extends StatelessWidget {
  const WorkoutController({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // padding: const EdgeInsets.only(top: 29, bottom: 40, left: 12, right: 12),
      color: pallete[Pallete.alaskanBlue],
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 29, bottom: 40, left: 12, right: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: pallete[Pallete.white],
                          backgroundColor: pallete[Pallete.red02],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          )),
                      child: Text(
                        '삭제',
                        style: types[Types.semi_md],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 28),
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: pallete[Pallete.white],
                        backgroundColor: pallete[Pallete.deepNavy],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        '수정',
                        style: types[Types.semi_md],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 2,
              child: Container(
                width: 82,
                height: 2,
                decoration: BoxDecoration(
                  color: pallete[Pallete.white],
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
