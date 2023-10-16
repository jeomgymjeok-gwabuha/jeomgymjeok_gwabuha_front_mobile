import 'package:flutter/material.dart';

enum Pallete {
  balck,
  white,
  flash,
  deepNavy,
  alaskanBlue,
  red01,
  red02,
  lightOrange,
  green,
  blue
}

const Map<Pallete, Color> pallete = {
  Pallete.balck: Color(0xff000000),
  Pallete.white: Color(0xffffffff),
  Pallete.flash: Color(0xffdff81e),
  Pallete.deepNavy: Color(0xff3a4565),
  Pallete.alaskanBlue: Color(0xff525c73),
  Pallete.red01: Color(0xffdf1125),
  Pallete.red02: Color(0xffff4961),
  Pallete.lightOrange: Color(0xfffd820b),
  Pallete.green: Color(0xff80e220),
  Pallete.blue: Color(0xff24A0ED),
};
