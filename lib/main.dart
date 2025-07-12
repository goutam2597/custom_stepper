import 'package:book_app/app/app_theme_data.dart';
import 'package:book_app/app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppThemeData.lightTheme, home: HomeScreen());
  }
}
