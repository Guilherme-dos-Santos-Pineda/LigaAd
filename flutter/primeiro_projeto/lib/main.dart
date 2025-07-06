import 'package:flutter/material.dart';
import 'package:primeiro_projeto/screens/home_screen.dart';
import 'package:primeiro_projeto/screens/login_screen.dart';
import 'package:primeiro_projeto/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Define qual rota será carregada primeiro
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
      },
    );
  }
}
