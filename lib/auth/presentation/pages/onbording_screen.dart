//onboarding Screen

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/shared/shared_widget/Custom_button.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/routes/routes_names.dart';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(keepPage: false);
  double currentIndex = 0;
  onSkipPressed() {
    Modular.to.pushReplacementNamed(AppRoutes.addNameScreen);
    setState(() {
      currentIndex = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.splashScreenBackground,
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index.toDouble();
                  });
                },
                children: [
                  OnboardingPage(
                    title:
                        'البساطة لها فوائدها! انغمس في تجربة خالية من المتاعب',
                    description: 'اترك التوتر خلفك واستمتع بالبساطة',
                    hight: context.propHeight(500),
                    image: AssetManger.Shape_4,
                    onboardingImage: AssetManger.onBording_4,
                    onSkipPressed: onSkipPressed,
                    imageHight: context.propHeight(394),
                  ),
                  OnboardingPage(
                    title: '! TO Do  خدمة',
                    description:
                        'نظم مهامك وحافظ على أهدافك، واستفد من وقتك إلى أقصى حد.',
                    hight: context.propHeight(500),
                    image: AssetManger.Shape_3,
                    onboardingImage: AssetManger.onBording_3,
                    onSkipPressed: onSkipPressed,
                    imageHight: context.propHeight(370),
                  ),
                  OnboardingPage(
                    title: 'خدمة بودكاست !',
                    description:
                        'ملفات بودكاست حصرية لن تجدها في أي مكان مع الميزات التفاعلية.',
                    hight: context.propHeight(500),
                    image: AssetManger.Shape_2,
                    onboardingImage: AssetManger.onBording_2,
                    onSkipPressed: onSkipPressed,
                    imageHight: context.propHeight(382),
                  ),
                
                ],
              ),
            ),
            SizedBox(height: context.propHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OnboardingIndicator(
                  index: 0,
                  currentIndex: currentIndex,
                ),
                SizedBox(width: context.propWidth(6)),
                OnboardingIndicator(
                  index: 1,
                  currentIndex: currentIndex,
                ),
                SizedBox(width: context.propWidth(6)),
                OnboardingIndicator(
                  index: 2,
                  currentIndex: currentIndex,
                ),
               
              ],
            ),
            SizedBox(height: context.propHeight(30)),
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButton(
                style: AppTheme(context).theme.textTheme.labelLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveText.responsiveFontSize(context, 20),
                    ),
                backgroundColor: AppColors.primaryColor,
                width: context.propWidth(327),
                height: context.propHeight(57),
                onPressed: () {
                  if (currentIndex < 2) {
                    pageController.animateToPage(
                      currentIndex.toInt() + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Modular.to.pushReplacementNamed(AppRoutes.addNameScreen);
                  }
                },
                title: currentIndex < 2 ? 'التالي' : 'إنضم إلينا',
              ),
            ),
          ],
        ));
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final double hight;
  final String onboardingImage;
  final VoidCallback onSkipPressed;
  final double imageHight;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.hight,
    required this.onboardingImage,
    required this.onSkipPressed,
    required this.imageHight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OnboardingImageStack(
          currentIndex: 0,
          onSkipPressed: onSkipPressed,
          image: image,
          hight: hight,
          onboardingImage: onboardingImage,
          imageHight: imageHight,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              left: context.propHeight(10),
              right: context.propHeight(10),
            ),
            child: Text(
              title,
              style: AppTheme(context).theme.textTheme.headlineLarge,
            ),
          ),
        ),
        SizedBox(height: context.propHeight(6)),
        Padding(
          padding: EdgeInsets.only(
            left: context.propHeight(10),
            right: context.propHeight(10),
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
            style: AppTheme(context).theme.textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}

// Onboarding indicator
class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);

  final int index;
  final double currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.propHeight(16),
      width: context.propWidth(16),
      decoration: ShapeDecoration(
        color: index == currentIndex ? AppColors.primaryColor : Colors.grey,
        shape: CircleBorder(),
      ),
    );
  }
}

class OnboardingImageStack extends StatelessWidget {
  final double currentIndex;
  final VoidCallback onSkipPressed;
  final String image;
  final double hight;
  final String onboardingImage;
  final double imageHight;

  const OnboardingImageStack({
    Key? key,
    required this.currentIndex,
    required this.onSkipPressed,
    required this.image,
    required this.hight,
    required this.onboardingImage,
    required this.imageHight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight,
      child: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: imageHight,
            fit: BoxFit.cover,
            color: AppColors.primaryColor
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              child: Image.asset(
                onboardingImage,
               
               // width: context.propWidth(250),
              ),
            ),
          ),
          // Skip button
          if (currentIndex != 3)
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(
                top: context.propHeight(45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: context.propWidth(148),
                    height: context.propHeight(56),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(136, 171, 141, 0.44),
                          Color.fromRGBO(255, 255, 255, 1),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: context.propWidth(130),
                        height: context.propHeight(45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x4cffffff),
                              offset: Offset(2, 2),
                              blurRadius: 6,
                            ),
                            BoxShadow(
                              color: Color(0x0affffff),
                              offset: Offset(-6, -6),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: onSkipPressed,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'هيا لنستمتع',
                                style: AppTheme(context)
                                    .theme
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: AppColors.sexthTextColor,
                                      fontSize:
                                          ResponsiveText.responsiveFontSize(
                                              context, 16),
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              SizedBox(width: context.propWidth(5)),
                              Image.asset(
                                AssetManger.arrow_left,
                                width: context.propWidth(24),
                                height: context.propHeight(24),
                                color: AppColors.sexthTextColor,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
