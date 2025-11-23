import 'package:flutter/material.dart';
import 'package:michi_app/design/infraestructure/pages/screenLogin.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michi App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB7A6FA),
        ),
      ),
      home: ScreenLogin(
        onLoginSuccess: () {
          // Por ahora solo probamos login
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login exitoso')),
          );
        },
      ),
    );
  }
}

