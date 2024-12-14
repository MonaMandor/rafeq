// features/broadcast/presentation/pages/broadcast_screen.dart
// ignore_for_file: prefer_const_constructors// ignore_for_file: prefer_const_constructors, prefer_const_constructors

import 'package:flutter_modular/flutter_modular.dart';
import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/broadcast.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/db_helper.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/broadcast/presentation/widgets/favorite_widget.dart';
import 'package:rafeq/broadcast/presentation/widgets/list_cart_widget.dart';
import 'package:rafeq/broadcast/presentation/widgets/slider_widget.dart';

import 'package:flutter/material.dart';
import 'package:rafeq/routes/routes_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BroadCastScreen extends StatefulWidget {
  const BroadCastScreen({Key? key}) : super(key: key);

  @override
  State<BroadCastScreen> createState() => _BroadCastScreenState();
}

class _BroadCastScreenState extends State<BroadCastScreen> {
  int currentIndex = 0;
  late SharedPreferences preferences;
  late DbHelper dbHelper;
  bool _isLoading = true; // Added a loading indicator

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    getPreference();
  }

  Future<void> getPreference() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = false; // Mark loading as complete
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Show loading indicator
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.splashScreenBackground,
        body: Padding(
          padding: EdgeInsets.only(
            top: context.propHeight(30),
            left: context.propWidth(20),
            right: context.propWidth(20),
          ),
          child: Column(
            children: [
              SizedBox(
                width: context.propWidth(10),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    Container(
                      width: context.propWidth(40),
                      height: context.propHeight(40),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(AssetManger.ascetiaLogo),
                          fit: BoxFit.fill,
                        ),
                        shape: OvalBorder(
                          side: BorderSide(width: 2, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.propWidth(10),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "مرحبا ${preferences.getString('name')}👋",
                            style: AppTheme(context)
                                .theme
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: ResponsiveText.responsiveFontSize(
                                      context, 12),
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF88AB8D),
                                ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          Modular.to
                              .pushNamed(AppRoutes.tasksScreens);
                        },
                        icon: Icon(Icons.menu))
                  ],
                ),
              ),
              SizedBox(
                height: context.propHeight(20),
              ),
              SizedBox(
                width: double.infinity,
                height: context.propHeight(128),
                child: PageView.builder(
                  itemCount: bradcastTitile.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SliderWidget(
                        index: index, currentIndex: currentIndex.toDouble());
                  },
                ),
              ),
              SizedBox(
                height: context.propHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  bradcastTitile.length,
                  (index) => Indicators(
                    index: index,
                    currentIndex:
                        currentIndex.toDouble(), // Pass currentIndex here
                  ),
                ),
              ),
              SizedBox(
                height: context.propHeight(30),
              ),
              Visibility(
                visible: isFavorite.any((element) => element),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المفضله ',
                          style: AppTheme(context)
                              .theme
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                fontSize: ResponsiveText.responsiveFontSize(
                                    context, 16),
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF090909),
                              ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'المزيد',
                            style: AppTheme(context)
                                .theme
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: ResponsiveText.responsiveFontSize(
                                      context, 12),
                                  fontWeight: FontWeight.w900,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.propHeight(20),
                    ),
                    SizedBox(
                      height:
                          context.propHeight(107), // Adjust height as needed
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                            isFavorite.length,
                            (index) {
                              if (isFavorite[index]) {
                                return FavoriteWidget(
                                  index: index,
                                  currentIndex: currentIndex.toDouble(),
                                );
                              } else {
                                return Container();
                              }
                            },
                          ).whereType<Widget>().toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.propHeight(5),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'واصل الاستماع',
                  style: AppTheme(context).theme.textTheme.titleLarge?.copyWith(
                        fontSize:
                            ResponsiveText.responsiveFontSize(context, 16),
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF090909),
                      ),
                ),
              ),
              SizedBox(
                height: context.propHeight(20),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      bradcastTitile.length,
                      (index) => ListCart(
                        index: index,
                        currentIndex:
                            currentIndex.toDouble(), // Pass currentIndex here
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
