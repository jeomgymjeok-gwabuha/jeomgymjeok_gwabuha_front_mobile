import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jeomgymjeok_gwabuha/screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppScreen(),
    );
  }
}
