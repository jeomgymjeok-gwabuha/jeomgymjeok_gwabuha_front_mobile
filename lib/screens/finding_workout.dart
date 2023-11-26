import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';

class FindingWorkout extends StatefulWidget {
  const FindingWorkout({
    super.key,
    required this.isFailedToSearch,
  });

  final bool isFailedToSearch;

  @override
  State<FindingWorkout> createState() => _FindingWorkoutState();
}

class _FindingWorkoutState extends State<FindingWorkout> {
  bool failed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () async {
        if (!widget.isFailedToSearch) {
          Navigator.of(context).pop(true);
        } else {
          setState(() {
            failed = widget.isFailedToSearch;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Builder(
        builder: (build) {
          if (failed) {
            return Container(
              width: width,
              height: double.infinity,
              color: pallete[Pallete.deepNavy],
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/angry.svg'),
                    const SizedBox(height: 36),
                    Text(
                      'ERROR!',
                      style: types[Types.extra_lg]!
                          .copyWith(color: pallete[Pallete.red01]),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '운동 데이터 불러오는 중에 오류가 발생하였습니다.\n잠시 후에 다시 시도해주세요.',
                      textAlign: TextAlign.center,
                      style: types[Types.semi_md]!.copyWith(
                        color: pallete[Pallete.white],
                      ),
                    ),
                    const SizedBox(height: 68),
                    TextBtn(
                      text: '뒤로 가기',
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      width: width,
                      backgroundColor: Pallete.red01,
                    ),
                  ],
                ),
              ),
            );
          }

          return Container(
            width: width,
            height: double.infinity,
            color: pallete[Pallete.deepNavy],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset('assets/images/loading.png'),
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            color: pallete[Pallete.flash],
                            backgroundColor: pallete[Pallete.white],
                            strokeWidth: 9.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '운동 데이터 불러오는 중..',
                    style: types[Types.extra_lg]!.copyWith(
                      color: pallete[Pallete.white],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
