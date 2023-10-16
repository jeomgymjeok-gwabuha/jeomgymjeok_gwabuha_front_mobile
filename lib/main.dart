import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/screens/home.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
