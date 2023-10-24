import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';
import 'package:jeomgymjeok_gwabuha/screens/calender.dart';
import 'package:jeomgymjeok_gwabuha/screens/graph.dart';
import 'package:jeomgymjeok_gwabuha/widgets/bottom_navigation.dart';

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
      activePage = const GraphScreen();
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        centerTitle: true,
        backgroundColor: pallete[Pallete.deepNavy],
        title: Image.asset('assets/images/appbar_logo.png'),
      ),
      body: SafeArea(child: activePage),
      bottomNavigationBar: BottomNavigation(
        pageIndex: _selectedPageIndex,
        onSelectPage: _selectPage,
      ),
    );
  }
}
