import 'package:flutter/material.dart';
import 'package:myntra/pages/homeScreen.dart';
import 'package:myntra/pages/splashScreen.dart';import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import your HomeScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Myntra',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(), // Splash screen route
          '/home': (context) => HomeScreen(), // Home screen route
          // Add more routes if needed
        },
      ),
    );
  }
}
