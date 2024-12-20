import 'package:rafeq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var kTextformFieldDecoration = InputDecoration(
  hintText: 'Enter your new task name',
  hintStyle: GoogleFonts.mcLaren(
    textStyle: TextStyle(
      color: Colors.grey,
    ),
  ),
);

 TextStyle kTextFormFeildstyel = TextStyle(
  color:AppColors.sexthTextColor,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);
const kTasksubtitlestyle = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.grey,
  fontSize: 14,
);

const kDateTimeStyele = TextStyle(
  fontSize: 11,
  color: Colors.blueGrey,
);

const kAlertTitleStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontSize: 25,
  fontWeight: FontWeight.w600,
);
const kAlertDescStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  color: Colors.blueGrey,
);
const kAlertButtonstyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
const kTextEmtystyle = TextStyle(
  color: Colors.grey,
  fontSize: 18,
);

const KDialogButtonTextStyle = TextStyle(
  fontSize: 13.0,
  fontWeight: FontWeight.bold,
);

var kDateContainerDecoration = BoxDecoration(
  
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
  
);
