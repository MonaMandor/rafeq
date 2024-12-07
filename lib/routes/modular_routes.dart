// ignore_for_file: implementation_imports, duplicate_ignore, depend_on_referenced_packages



import 'package:rafeq/auth/presentation/pages/onbording_screen.dart';
import 'package:rafeq/auth/presentation/pages/splash_screen.dart';
import 'package:rafeq/broadcast/presentation/pages/broadcast_screen.dart';

import 'package:rafeq/auth/presentation/pages/add_name.dart';
import 'package:rafeq/routes/routes_names.dart';

import 'package:rafeq/task_manger/screens/tasks_screens.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_interfaces/src/route/modular_arguments.dart';

List<ModularRoute> modularRoutes = <ChildRoute<dynamic>>[
  ChildRoute<dynamic>(
    AppRoutes.start,
    child: (_, ModularArguments args) => const SplashScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.onboardingScreen,
    child: (_, ModularArguments args) => const OnboardingScreen(),
    transition: TransitionType.upToDown,
  ),
  ChildRoute<dynamic>(
    AppRoutes.SplashScreen,
    child: (_, ModularArguments args) => const SplashScreen(),
    transition: TransitionType.upToDown,
  ),
  
  ChildRoute<dynamic>(
    AppRoutes.broadcastScreen,
    child: (_, ModularArguments args) =>  BroadCastScreen(),
    transition: TransitionType.upToDown,
  ),
  
  
  
  ChildRoute<dynamic>(
    AppRoutes.addNameScreen,
    child: (_, ModularArguments args) =>  AddNameScreen(),
    transition: TransitionType.upToDown,
  ),
 
  ChildRoute<dynamic>(
    AppRoutes.tasksScreens,
    child: (_, ModularArguments args) =>  TasksScreens(),
    transition: TransitionType.upToDown,
  ),
  
  

  
  



];
