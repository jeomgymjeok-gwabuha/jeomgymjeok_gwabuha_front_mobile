import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Types {
  extra_xs,
  extra_sm,
  extra_md,
  extra_lg,
  semi_xs,
  semi_sm,
  semi_md,
  semi_lg,
  regular_xs,
  regular_sm,
  regular_md,
  regular_lg,
  light_xs,
  light_sm,
  light_md,
  light_lg,
  input_helper
}

final Map<Types, TextStyle> types = {
  Types.extra_xs: GoogleFonts.poppins(
    fontSize: 8,
    height: 2.5,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  ),
  Types.extra_sm: GoogleFonts.poppins(
    fontSize: 12,
    height: 1.67,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  ),
  Types.extra_md: GoogleFonts.poppins(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.5,
  ),
  Types.extra_lg: GoogleFonts.poppins(
    fontSize: 20,
    height: 1,
    fontWeight: FontWeight.w800,
  ),

  // semi style
  Types.semi_xs: GoogleFonts.poppins(
    fontSize: 8,
    height: 1.5,
    fontWeight: FontWeight.w600,
  ),
  Types.semi_sm: GoogleFonts.poppins(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w600,
  ),
  Types.semi_md: GoogleFonts.poppins(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w600,
  ),
  Types.semi_lg: GoogleFonts.poppins(
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w600,
  ),

  // regular style
  Types.regular_xs: GoogleFonts.poppins(
    fontSize: 8,
    height: 1.5,
    fontWeight: FontWeight.w400,
  ),
  Types.regular_sm: GoogleFonts.poppins(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w400,
  ),
  Types.regular_md: GoogleFonts.poppins(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w400,
  ),
  Types.regular_lg: GoogleFonts.poppins(
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w400,
  ),

  // light style
  Types.light_xs: GoogleFonts.poppins(
    fontSize: 8,
    height: 1.5,
    fontWeight: FontWeight.w300,
  ),
  Types.light_sm: GoogleFonts.poppins(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w300,
  ),
  Types.light_md: GoogleFonts.poppins(
    fontSize: 16,
    height: 1.5,
    fontWeight: FontWeight.w300,
  ),
  Types.light_lg: GoogleFonts.poppins(
    fontSize: 20,
    height: 1.5,
    fontWeight: FontWeight.w300,
  ),
  Types.input_helper: GoogleFonts.roboto(
    fontSize: 12,
    height: 1.6,
    fontWeight: FontWeight.w400,
  ),
};
