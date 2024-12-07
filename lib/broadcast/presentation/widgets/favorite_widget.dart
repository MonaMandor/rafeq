// features/broadcast/presentation/widgets/favorite_widget.dart
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:rafeq/core/constansts/strings/broadcast.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/broadcast/presentation/widgets/PlayingScreen.dart';
import 'package:flutter/material.dart';


class FavoriteWidget extends StatefulWidget {
  final int index;
  final double currentIndex;
  FavoriteWidget({required this.index, required this.currentIndex});

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
          Container(
              width: context.propWidth(56),
              height: context.propHeight(56),
              decoration: ShapeDecoration(
                color: Color(0xFF88AB8D),
                shape: OvalBorder(
                  side: BorderSide(
                    width: context.propWidth(2),
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Colors.white,
                  ),
                ),
              ),
              child: InkWell(
                onTap: () {
                  r = widget.index;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayingScreen()));
                },
                child:
                    Image.asset(bradcastImages[widget.index], fit: BoxFit.fill),)
            ),
            SizedBox(
              height: context.propHeight(15),
            ),
            Text(
              bradcastTitile[widget.index],
              style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                    fontSize:ResponsiveText.responsiveFontSize(context, 14),
                    fontWeight: FontWeight.w400,
                     color: Color(0x99090909),
                  ),
            ),
          ],
        ),
        SizedBox(
          width: context.propWidth(8),
        ),
      ],
    );
  }
}

