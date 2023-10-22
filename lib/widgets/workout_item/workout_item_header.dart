import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class WorkoutItemHeader extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTapHeader,
      child: Container(
        width: fullWidth,
        height: 80,
        color: pallete[Pallete.alaskanBlue],
        child: Stack(children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
                width: fullWidth,
                height: 80,
                padding: const EdgeInsets.only(left: 52, right: 51),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: types[Types.semi_lg]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                    ),
                    Text(
                      '${totalSetCount}Set',
                      style: types[Types.semi_lg]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                    ),
                  ],
                )),
          ),
          Positioned(
            left: 0,
            bottom: 8,
            child: Container(
              width: fullWidth,
              height: 2,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: AnimatedContainer(
                width: isExpanded ? fullWidth : 82,
                height: 2,
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isExpanded
                      ? pallete[Pallete.deepNavy]!.withOpacity(0.5)
                      : pallete[Pallete.white],
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
