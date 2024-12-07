// features/broadcast/presentation/widgets/list_cart_widget.dart
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:rafeq/core/constansts/strings/broadcast.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/broadcast/presentation/widgets/PlayingScreen.dart';
import 'package:flutter/material.dart';

class ListCart extends StatefulWidget {
  final int index;
  final double currentIndex;
  ListCart({required this.index, required this.currentIndex});

  @override
  _ListCartState createState() => _ListCartState();
}

class _ListCartState extends State<ListCart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //width: context.propWidth(345),
          height: context.propHeight(102),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 10,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: InkWell(
            onTap: () {
              r = widget.index;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PlayingScreen()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: context.propWidth(75),
                    height: context.propHeight(102),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: AppColors.splashScreenBackground,
                    ),
                    child: Image.asset(
                      bradcastImages[widget.index],
                      fit: BoxFit.fill,
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    right: context.propWidth(8),
                    top: context.propHeight(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        bradcastTitile[widget.index]+':',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                              fontSize: ResponsiveText.responsiveFontSize(context, 11),
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                      ),

                     SizedBox(
                        height: context.propHeight(10),
                      ),
                      Text(
                        broadcastCaption[widget.index],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                              fontSize: ResponsiveText.responsiveFontSize(context, 10),
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                      ),
                      
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: context.propWidth(14),
                      top: context.propHeight(10),
                      left: context.propWidth(10)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: context.propWidth(20),
                      height: context.propHeight(20),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                        shadows: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 10,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (isFavorite[widget.index] == false) {
                              isFavorite[widget.index] = true;
                            } else {
                              isFavorite[widget.index] = false;
                            }
                          });
                        },
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: isFavorite[widget.index]
                                ? Colors.red
                                : Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: context.propHeight(15),
        ),
      ],
    );
  }
}

