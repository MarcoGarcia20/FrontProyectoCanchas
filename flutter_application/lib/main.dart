import 'package:flutter/material.dart';
// import 'Pantallas/login.dart';
import 'Pantallas/inicio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alquiler de Canchas de Futbol',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xF6FBF9FA),
      ),
      // home: const LoginScreen(),
      home : HomeScreen(),
    );
  }
}
