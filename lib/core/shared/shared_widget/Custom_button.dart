
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// Custom button
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
    this.style,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final double? radius;
  final double? width;
  final double? height;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: context.propHeight(15)),
      minWidth: width ?? double.infinity,
      height: height,
      color: backgroundColor ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 15),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: style
      ),
    );
  }
}