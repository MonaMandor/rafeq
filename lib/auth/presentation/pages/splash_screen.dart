// features/auth/presentation/pages/splash_screen.dart


// ignore_for_file: prefer_const_constructors

import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>

    with TickerProviderStateMixin {
  late AnimationController _animationController;

  // Create animation controllers and delays for three dots
  late AnimationController _dotController1;
  late AnimationController _dotController2;
  late AnimationController _dotController3;
  late bool _isFirstTime;
  @override
void initState() {
  super.initState();
  Future.delayed(const Duration(seconds: 3), () async {
    final prefs = await SharedPreferences.getInstance();
    _isFirstTime = prefs.getBool('isFirstTime') ?? true;

    if (_isFirstTime) {
      Modular.to.pushReplacementNamed(AppRoutes.onboardingScreen);
      await prefs.setBool('isFirstTime', false);
    } else {
      Modular.to.pushReplacementNamed(AppRoutes.broadcastScreen);
    }
  });


    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    // Create animation controllers for the three dots
    _dotController1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _dotController2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true, period: const Duration(milliseconds: 333));

    _dotController3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true, period: const Duration(milliseconds: 667));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _dotController1.dispose();
    _dotController2.dispose();
    _dotController3.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashScreenBackground,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AssetManger.ascetiaLogo,
              /* width: context.propWidth(259),
              height: context.propHeight(212), */
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.propHeight(180)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotAnimation(animation: _dotController1),
                  SizedBox(width: context.propWidth(16)),
                  DotAnimation(animation: _dotController2),
                  SizedBox(width: context.propWidth(16)),
                  DotAnimation(animation: _dotController3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DotAnimation extends StatelessWidget {
  final Animation<double> animation;

  const DotAnimation({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    // return ScaleTransition(

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
            scale: animation.value,
            child: Container(
              width: context.propWidth(27),
              height: context.propHeight(27),
              decoration:  ShapeDecoration(
                color: AppColors.primaryColor,
                shape: CircleBorder(),
              ),
            ));
      },
    );
  }
}




