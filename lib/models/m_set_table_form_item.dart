import 'package:flutter/material.dart';

class MSetTableFormItem {
  MSetTableFormItem({
    required this.sequence,
    required this.weightController,
    required this.countController,
  });

  final int sequence;
  final TextEditingController weightController;
  final TextEditingController countController;

  get isWeightEmpty {
    return weightController.text.isEmpty;
  }

  get isCountEmpty {
    return countController.text.isEmpty;
  }
}
