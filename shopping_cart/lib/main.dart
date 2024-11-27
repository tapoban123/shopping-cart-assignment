import 'package:flutter/material.dart';
import 'package:shopping_cart/pages/catalogue_page.dart';
import 'package:shopping_cart/theme/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping Cart UI",
      theme: ThemeData.light(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: CustomColors.scaffoldBackgroundColor,
          surfaceTintColor: CustomColors.scaffoldBackgroundColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const CataloguePage(),
    );
  }
}
