//  will ask use for their name here

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/db_helper.dart';
import 'package:rafeq/core/shared/shared_widget/Custom_button.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/core/theme/app_colors.dart';


import 'package:rafeq/routes/routes_names.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({Key? key}) : super(key: key);

  @override
  _AddNameState createState() => _AddNameState();
}

class _AddNameState extends State<AddNameScreen> {
  //
  DbHelper dbHelper = DbHelper();

  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            12.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: context.propHeight(100),
              ),
              Image.asset(
                AssetManger.ascetiaLogo,
                width: context.propWidth(150),
                height: context.propHeight(150),
              ),
              //
              SizedBox(
                height: context.propHeight(20),
              ),
              //
              Text(
                'أهلا بك في عالمنا ',
                style: GoogleFonts.tajawal(
                  fontSize: ResponsiveText.responsiveFontSize(context, 18),
            
                  fontWeight: FontWeight.w700,
                  color: AppColors.sexthTextColor,
                ),
              ),
              SizedBox(
                height: context.propHeight(10),
              ),
              Text(
                'بماذا تحب أن نناديك في عالمنا ؟',
                style: GoogleFonts.tajawal(
                  fontSize:ResponsiveText.responsiveFontSize(context, 12),
            
                  fontWeight: FontWeight.w700,
                  color: AppColors.sexthTextColor,
                ),
              ),
              //
              SizedBox(
                height: context.propHeight(20),
              ),
              //
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: context.propHeight(16),
                  horizontal: context.propWidth(16),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "أدخل اسمك",
                    border: InputBorder.none,
                  ),
                  style: GoogleFonts.tajawal(
                    fontSize:ResponsiveText.responsiveFontSize(context, 18),
            
                    fontWeight: FontWeight.w700,
                    color: AppColors.sexthTextColor,
                  ),
                  maxLength: 12,
                  onChanged: (val) {
                    name = val;
                  },
                ),
              ),
              //
              SizedBox(height: context.propHeight(50)),
              //
              SizedBox(
                  height: context.propHeight(50),
                  child: CustomButton(
                    title: 'هيا نبدأ',
                    style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                    onPressed: () async {
                      if (name.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            action: SnackBarAction(
                              label: 'إغلاق',
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                              },
                            ),
                            backgroundColor: Colors.white,
                            content: Text(
                              'الرجاء إدخال اسم صحيح',
                              style: GoogleFonts.tajawal(
                                fontSize:ResponsiveText.responsiveFontSize(context, 12),
            
                                fontWeight: FontWeight.w700,
                                color: AppColors.sexthTextColor,
                              ),
                            ),
                          ),
                        );
                      } else {
                        DbHelper dbHelper = DbHelper();
                        await dbHelper.addName(name);
                        Modular.to.pushReplacementNamed(
                            AppRoutes.broadcastScreen); // Navigate using Modular
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
