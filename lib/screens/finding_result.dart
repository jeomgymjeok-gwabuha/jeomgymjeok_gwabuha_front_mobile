import 'package:flutter/material.dart';
import 'package:jeomgymjeok_gwabuha/design/Pallete.dart';

class FindingResult extends StatefulWidget {
  const FindingResult({
    super.key,
    required this.workoutName,
  });

  final String workoutName;

  @override
  State<FindingResult> createState() => _FindingResultState();
}

class _FindingResultState extends State<FindingResult> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        centerTitle: true,
        backgroundColor: pallete[Pallete.deepNavy],
        title: Image.asset('assets/images/appbar_logo.png'),
        elevation: 0,
      ),
      body: Center(
        child: Text('hello ${widget.workoutName}'),
      ),
    );
  }
}
