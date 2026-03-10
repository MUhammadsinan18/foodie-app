import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodieapp/auth/pages/login_page.dart';

void main() {
  runApp(  ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          titleMedium: TextStyle(fontSize: 15),
          titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrangeAccent,
          primary: Color.fromRGBO(255, 221, 197, 1),
          secondary: Color.fromRGBO(232, 106, 18, 1),
        ),
      ),
      debugShowCheckedModeBanner: false,

      title: "MR_foodie",
      home: LoginPage(),

    );
  }
}
