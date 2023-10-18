import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/screens/calender.dart';
import 'package:jeomgymjeok_gwabuha/screens/workout.dart';
import 'package:jeomgymjeok_gwabuha/widgets/BottomNavigation.dart';

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
      bottomNavigationBar: BottomNavigation(
        pageIndex: _selectedPageIndex,
        onSelectPage: _selectPage,
      ),
    );
  }
}