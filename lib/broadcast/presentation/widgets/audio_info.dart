// ignore_for_file: prefer_const_constructors

import 'package:rafeq/core/constansts/strings/broadcast.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:flutter/material.dart';


class AudioInfo extends StatelessWidget {

  AudioInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: bradcastTitile[r],
         child:  Container(
          width: context.propWidth(343),
          height: context.propHeight(256),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Image.asset(
            bradcastImages[r],
            fit: BoxFit.cover,
          ),
          
        ),),
        const SizedBox(height: 30),
        Text(
          bradcastTitile[r],
          style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
            fontSize: ResponsiveText.responsiveFontSize(context, 24),
            
            fontWeight: FontWeight.w700,
            color: Color(0xFF090909),
          ),
        ),
         SizedBox(height: context.propHeight(20)),
         Text(
          broadcastCaption[r],
          style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
            fontSize:ResponsiveText.responsiveFontSize(context, 16),
            fontWeight: FontWeight.w400,
            color: Color(0xFF090909),
          ),
        ),
      ],
    );
  }
}
