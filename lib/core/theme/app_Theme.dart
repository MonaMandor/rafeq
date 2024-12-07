import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
class ResponsiveText {
  static double responsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    // You can adjust the multiplier based on your design requirements
    double scaleFactor = screenWidth / 375.0; // Assuming the base design width is 375.0

    return (baseSize * scaleFactor).roundToDouble();
  }
}

class AppTheme {
  final BuildContext context;
   AppTheme(this.context);
  ThemeData get theme => ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.splashScreenBackground,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.tajawal(
            fontSize: ResponsiveText.responsiveFontSize(context, 24),
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryTextColor,
            
          ),
          headlineMedium: GoogleFonts.tajawal(
            fontSize: ResponsiveText.responsiveFontSize(context, 16),
            fontWeight: FontWeight.w400,
            color: AppColors.thirdTextColor,
          ),
          headlineSmall: GoogleFonts.tajawal(
            fontSize: ResponsiveText.responsiveFontSize(context, 20),
            fontWeight: FontWeight.w400,
            color: AppColors.fourthTextColor,
          ),
          
          titleLarge: GoogleFonts.tajawal(
            fontSize:ResponsiveText.responsiveFontSize(context, 16),
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryTextColor,
          ),
          titleMedium: GoogleFonts.tajawal(
            fontSize: ResponsiveText.responsiveFontSize(context, 16),
            fontWeight: FontWeight.w500,
            color: AppColors.secondaryTextColor,
          ),
          titleSmall: GoogleFonts.tajawal(
            fontSize: ResponsiveText.responsiveFontSize(context, 14),
            fontWeight: FontWeight.w500,
            color: AppColors.sexthTextColor,
          ),
            bodyLarge:  GoogleFonts.tajawal(
            fontSize:ResponsiveText.responsiveFontSize(context, 14),
            fontWeight: FontWeight.w400,
            color: AppColors.fourthTextColor,
          ),
          
          bodyMedium: GoogleFonts.inter(
            fontSize: ResponsiveText.responsiveFontSize(context, 14),
            
            fontWeight: FontWeight.w300,
            color: AppColors.sexthTextColor,
          ),
          bodySmall: GoogleFonts.inter(
            fontSize: ResponsiveText.responsiveFontSize(context, 12),
            
            fontWeight: FontWeight.w300,
            color: AppColors.thirdTextColor,
          ),
          labelLarge:  GoogleFonts.inter(
            fontSize: ResponsiveText.responsiveFontSize(context, 16),
            
            fontWeight: FontWeight.w800,
            color: AppColors.sexthTextColor,
          ),
          labelMedium:  GoogleFonts.inter(
            fontSize: ResponsiveText.responsiveFontSize(context, 14),
            
            fontWeight: FontWeight.w700,
            color: AppColors.sexthTextColor,
          ),
          labelSmall:  GoogleFonts.tajawal(
            fontSize:ResponsiveText.responsiveFontSize(context, 11),
            
            fontWeight: FontWeight.w700,)
          
          

        ),

        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.inter(
            fontSize: ResponsiveText.responsiveFontSize(context, 14),
            
            fontWeight: FontWeight.w400,
            color: AppColors.thirdTextColor,
          ),
          labelStyle: GoogleFonts.inter(
            fontSize: ResponsiveText.responsiveFontSize(context, 20),
            
            fontWeight: FontWeight.w700,
            color: AppColors.fourthTextColor,
          ),

        ),
      );
}
