// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/broadcast.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/broadcast/presentation/widgets/PlayingScreen.dart';
import 'package:flutter/material.dart';


class SliderWidget extends StatefulWidget {
  final int index;
  final double currentIndex; // Add currentIndex parameter
  SliderWidget(
      {required this.index,
      required this.currentIndex}); // Add currentIndex parameter

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.propHeight(128),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFAFC7AD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: InkWell(
        onTap: () {
          r = widget.index;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlayingScreen()));
        },
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'استمتع بأفضل بودكاست',
                  style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                        fontSize: ResponsiveText.responsiveFontSize(context, 16),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF090909),
                      ),
                ),
                Text(
                 bradcastTitile [widget.index],
                  style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                        fontSize: ResponsiveText.responsiveFontSize(context, 16),
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                ),
                Container(
                  width: context.propWidth(112),
                  height: context.propHeight(32),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.propWidth(9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تشغيل الان',
                          style:
                              AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                                    fontSize: ResponsiveText.responsiveFontSize(context, 12),
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xCC090909),
                                  ),
                        ),
                        Container(
                          width: context.propWidth(26),
                          height: context.propHeight(26),
                          decoration: ShapeDecoration(
                            color: Color(0xFF090909),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                AssetManger.wave,
                fit: BoxFit.cover,
              ))
        ]),
      ),
    );
  }
}

class Indicators extends StatelessWidget {
  final int index;
  final double currentIndex;
  const Indicators({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: context.propHeight(16),
          width: context.propWidth(16),
          decoration: ShapeDecoration(
            color: index == currentIndex ? AppColors.primaryColor : Colors.grey,
            shape: CircleBorder(),
          ),
        ),
        SizedBox(
          width: context.propWidth(8),
        ),
      ],
    );
  }
}


