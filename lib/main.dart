import 'package:clean_archi/application/pages/constant/page_name.dart';
import 'package:clean_archi/application/pages/home/homepage.dart';
import 'package:clean_archi/injection.dart';
import 'package:clean_archi/route.dart';
import 'package:flutter/material.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark(),
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffc8d9eb)),
      initialRoute: PageName.homePage,
      onGenerateRoute: OnGenerateRoute().generateRoute,
    );
  }
}
