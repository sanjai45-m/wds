import 'package:demo/ui/home_page.dart';
import 'package:demo/ui/login_page.dart';
import 'package:flutter/material.dart';

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
        primaryColor: Color(0xFF28D8A1), // Set the primary color here

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF28D8A1)), // Also update the color scheme to match
        useMaterial3: true,
      ),
      home:LoginUi(),
    );
  }
}
