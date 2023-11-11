import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class MSetTableFormItem {
  MSetTableFormItem({
    String? id,
    required this.weightController,
    required this.countController,
  }) : id = id ?? uuid.v4();

  final String id;
  final TextEditingController weightController;
  final TextEditingController countController;

  get isWeightEmpty {
    return weightController.text.isEmpty;
  }

  get isCountEmpty {
    return countController.text.isEmpty;
  }
}
