// main.dart

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';
import 'package:rafeq/core/theme/app_Theme.dart';
import 'package:rafeq/routes/module.dart';
import 'package:rafeq/task_manger/models/task_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('money');



  runApp(
    DevicePreview(

enabled: false,
      builder: (context) => ModularApp(
        module: AppModule(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Ascetia',
        theme: AppTheme(context).theme,
       
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
      ),
    );
  }
}
