// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final Color? fillColor;
  final double? height;
  final double? width;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final TextStyle? hintStyle;
  final bool obscureText;
  final Widget suffix;
  final Widget suffix_;
  final Widget? prefix;

  const CustomTextField({
    super.key,
    this.fillColor,
    this.height,
    this.width,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.validator,
    this.errorMessage,
    required this.hintStyle,
    required this.obscureText,
    required this.suffix,
    required this.suffix_,
    this.prefix,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasText = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the controller to detect changes in the text field
    widget.controller?.addListener(() {
      setState(() {
        hasText = widget.controller?.text.isNotEmpty ?? false;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            
            keyboardType: widget.keyboardType,
            controller: widget.controller,
            validator: widget.validator,
            obscureText: widget.obscureText,
            
            style: AppTheme(context)
                .theme
                .textTheme
                .bodyLarge
                ?.copyWith(color: AppColors.primaryTextColor),
            decoration: InputDecoration(
              errorStyle:  TextStyle(
                fontSize: ResponsiveText.responsiveFontSize(context, 14),
            
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
              fillColor:
                  hasText ? Colors.white : widget.fillColor ?? Colors.white,
              filled: true,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle,
              labelText: widget.labelText,
              prefixIcon: widget.prefix,
              
              suffixIcon: Visibility(
                visible: !hasText,
                child: widget.suffix,
              ),
              suffix: Visibility(
                visible: hasText,
                child: widget.suffix_,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.red, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: hasText
                        ? Color(0xFF2E4EA0)
                        : Color(0xFFA9B3BC).withOpacity(.00001),
                    width: 1.0,
                  )),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: hasText
                      ? Color(0xFF2E4EA0)
                      : Color(0xFFA9B3BC).withOpacity(.00001),
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: hasText ? Colors.green : Colors.red,
                  width: 1.0,
                ),
              ),
              contentPadding: EdgeInsets.only(
                bottom: context.propHeight(15),
                right: context.propWidth(14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
