import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';

class HorizontalDottedDivider extends StatelessWidget {
  const HorizontalDottedDivider({
    super.key,
    this.space,
    this.length,
    this.thickness,
    this.color,
    this.indent,
    this.endIndent,
  })  : assert(space == null || space >= 0.0),
        assert(length == null || length >= 0.0),
        assert(thickness == null || thickness >= 0.0),
        assert(indent == null || indent >= 0.0),
        assert(endIndent == null || endIndent >= 0.0);

  final double? space; // 디바이더의 높이
  final double? length; // 점선 하나의 길이
  final double? thickness; // 점선의 두께
  final Color? color; // 점선의 색깔
  final double? indent; // 점선이 시작하기 전 빈 공간 길이
  final double? endIndent; // 점선이 끝난 후 빈공간 길이

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final double space = this.space ?? 10.0;
    final double length = this.length ?? 10.0;
    final double thickness = this.thickness ?? 5.0;
    final Color color = this.color ?? pallete[Pallete.balck]!;
    final double indent = this.indent ?? 0.0;
    final double endIndent = this.endIndent ?? 0.0;

    return Padding(
      padding: EdgeInsets.only(left: indent, right: endIndent),
      child: Container(
        height: space,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final boxWidth = constraints.constrainWidth();
            final dashedLength = length;
            final dashedThickness = thickness;
            final dashedCount = (boxWidth / (2 * dashedLength)).floor();

            return Flex(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.horizontal,
              children: List.generate(
                dashedCount,
                (index) => SizedBox(
                  width: dashedLength,
                  height: dashedThickness,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
