import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';
import 'package:jeomgymjeok_gwabuha/providers/workout_provider.dart';
import 'package:jeomgymjeok_gwabuha/screens/finding_workout.dart';
import 'package:jeomgymjeok_gwabuha/widgets/common/text_btn.dart';

class GraphScreen extends ConsumerStatefulWidget {
  const GraphScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _GraphScreenState();
  }
}

class _GraphScreenState extends ConsumerState<GraphScreen> {
  final SearchController _searchController = SearchController();
  bool failedSearch = false;
  bool isInvalidName = false;

  List<String> get names {
    return ref.watch(workoutNames);
  }

  void _submit(BuildContext context) async {
    setState(() {
      isInvalidName = false;
    });

    if (_searchController.text.isEmpty) {
      setState(() {
        isInvalidName = true;
      });

      return;
    }

    var response = await showDialog(
      context: context,
      builder: (context) {
        final _isFailedToSearch =
            names.where((element) => _searchController.text == element).isEmpty;

        return FindingWorkout(isFailedToSearch: _isFailedToSearch);
      },
    );

    if (!response) {
      return;
    }

    if (!mounted) {
      return;
    }

    context.pushNamed('find-result', extra: _searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        centerTitle: true,
        backgroundColor: pallete[Pallete.deepNavy],
        title: Image.asset('assets/images/appbar_logo.png'),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 60),
        child: Column(
          children: [
            SearchAnchor(
              searchController: _searchController,
              viewConstraints: const BoxConstraints(
                minHeight: 176,
                maxHeight: 176,
              ),
              viewHintText: '운동 이름을 검색해주세요.',
              isFullScreen: false,
              viewSide: BorderSide(
                width: 1,
                color: pallete[Pallete.deepNavy]!,
              ),
              viewShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              viewElevation: 0,
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
                      color: isInvalidName
                          ? pallete[Pallete.red02]!
                          : pallete[Pallete.deepNavy]!,
                    );
                  }),
                  hintText: '운동 이름을 검색해주세요.',
                  hintStyle: MaterialStateProperty.resolveWith(
                    (states) => types[Types.semi_md]!.copyWith(
                      color: isInvalidName
                          ? pallete[Pallete.red02]
                          : pallete[Pallete.alaskanBlue],
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
                  leading: isInvalidName
                      ? SvgPicture.asset('assets/icons/error_search.svg')
                      : SvgPicture.asset('assets/icons/search.svg'),
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
            const Spacer(flex: 1),
            TextBtn(
              text: '불러오기',
              onPressed: () => _submit(context),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
