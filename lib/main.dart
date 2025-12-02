import 'package:flutter/material.dart';
import 'package:flutter_jiyoon_homework/view/251127_showpping_bag_view.dart';
import 'package:flutter_jiyoon_homework/view_study/251128_view1.dart';
import 'package:flutter_jiyoon_homework/view_study/251128_view2.dart';
import 'package:flutter_jiyoon_homework/view_study/251202_view3.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  //  runApp(ProviderScope(child:MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  

  // 1. 카운터 메인
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Example(),
  //   );
    
  // }

  //2. 알람 메인
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(

  //     darkTheme: ThemeData(
  //       brightness: Brightness.dark,
  //       scaffoldBackgroundColor: Colors.black,
  //       appBarTheme: AppBarTheme(
  //         backgroundColor: Colors.black, foregroundColor: Colors.white,
  //       )
  //     ),
  //     home: Alarm(),
  //   );
  // }

  //3.쇼핑 백 메인
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: View3(),
    );  
  }
}

