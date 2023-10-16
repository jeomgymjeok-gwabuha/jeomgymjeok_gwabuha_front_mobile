import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/screens/calender.dart';
import 'package:jeomgymjeok_gwabuha/screens/workout.dart';

enum ScreenType { calendar, workout }

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AppScreenState();
  }
}

class _AppScreenState extends State<AppScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CalendarScreen();

    if (_selectedPageIndex == ScreenType.workout.index) {
      activePage = const WorkoutScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, world'),
      ),
      body: activePage,
      bottomNavigationBar: SizedBox(
        height: Platform.isIOS ? 120 : 80,
        child: BottomNavigationBar(
          backgroundColor: pallete[Pallete.deepNavy],
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          selectedItemColor: pallete[Pallete.flash],
          unselectedItemColor: pallete[Pallete.white],
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            height: 2,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            height: 2,
          ),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/calendar.svg',
                  width: 24, height: 24),
              activeIcon: SvgPicture.asset('assets/icons/calender_active.svg',
                  width: 24, height: 24),
              label: '캘린더',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/workout.svg',
                  width: 24, height: 24),
              activeIcon: SvgPicture.asset('assets/icons/workout_active.svg',
                  width: 24, height: 24),
              label: '운동 기록',
            ),
          ],
        ),
      ),
    );
  }
}
