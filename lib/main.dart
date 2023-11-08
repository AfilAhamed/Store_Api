import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api/controller/category_controller.dart';
import 'package:store_api/controller/details_controller.dart';
import 'package:store_api/controller/home_controller.dart';
import 'package:store_api/helpers/colors.dart';
import 'package:store_api/view/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeScreenController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Store Api',
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
      ),
    );
  }
}
