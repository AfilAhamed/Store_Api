import 'package:flutter/material.dart';
import 'package:store_api/helpers/colors.dart';
import 'package:store_api/view/homescreen/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors().lightScaffoldColor,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors().lightIconsColor),
            backgroundColor: AppColors().lightScaffoldColor,
            titleTextStyle: TextStyle(
              color: AppColors().lightTextColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: const HomeScreen(),
    );
  }
}
