import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class TextBtn extends StatelessWidget {
  const TextBtn({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 120,
    this.height = 56,
    this.borderRadius = 14,
    this.backgroundColor = Pallete.deepNavy,
    this.textColor = Pallete.white,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final String text;

  final Pallete? backgroundColor;
  final Pallete? textColor;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: pallete[backgroundColor],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: types[Types.semi_md]!.copyWith(
            color: pallete[textColor],
          ),
        ),
      ),
    );
  }
}
