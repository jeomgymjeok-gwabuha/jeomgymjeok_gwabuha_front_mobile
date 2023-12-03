import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.pages,
    required this.pageIndex,
  });

  final List<String> pages;
  final int pageIndex;

  void _selectPage(BuildContext context, int index) {
    final GoRouter route = GoRouter.of(context);
    final page = pages[index];

    route.pushReplacement(page);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Platform.isIOS ? 120 : 80,
      child: BottomNavigationBar(
        backgroundColor: pallete[Pallete.deepNavy],
        onTap: (index) => _selectPage(context, index),
        currentIndex: pageIndex,
        selectedItemColor: pallete[Pallete.flash],
        unselectedItemColor: pallete[Pallete.white],
        selectedLabelStyle: types[Types.regular_sm],
        unselectedLabelStyle: types[Types.regular_sm],
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/calendar.svg',
                width: 24, height: 24),
            activeIcon: SvgPicture.asset('assets/icons/calender_active.svg',
                width: 24, height: 24),
            label: '캘린더',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/graph.svg',
                width: 24, height: 24),
            activeIcon: SvgPicture.asset('assets/icons/graph_active.svg',
                width: 24, height: 24),
            label: '그래프',
          ),
        ],
      ),
    );
  }
}
