import 'package:flutter/material.dart';
import 'design/organisms/login_section.dart';
import 'design/atoms/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor:Color(0xFFFAFAFA),
      ),
      home: const Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: LoginSection(), // form
            ),
          ),
        ),
      ),
    );
  }
}
