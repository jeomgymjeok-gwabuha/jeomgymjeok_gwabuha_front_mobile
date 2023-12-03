import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/design/Types.dart';

enum ScreenType { calendar, workout }

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends State<AppScreen> {
  int _selectedPageIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });

    _goBranch(_selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: SizedBox(
        height: Platform.isIOS ? 120 : 80,
        child: BottomNavigationBar(
          backgroundColor: pallete[Pallete.deepNavy],
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
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
      ),
    );
  }
}
