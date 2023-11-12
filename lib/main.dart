import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/core/api_services/api_services.dart';
import 'package:hotelsgo_task/core/service_locator/service_locator.dart';
import 'package:hotelsgo_task/features/home/presentation/view/home_screen.dart';

void main()async{
  await ApiServices.init();
  ServicesLocator().init();
  await ScreenUtil.ensureScreenSize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}