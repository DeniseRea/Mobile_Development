import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:michi_app/authProvider.dart';
import 'package:michi_app/design/infraestructure/pages/screenLogin_.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Michito App',
        theme: ThemeData(useMaterial3: true),
        initialRoute: '/',
        routes: {
          '/': (_) => const LoginPage(),
          '/home': (_) => const Scaffold(body: Center(child: Text('Home'))),
        },
      ),
    );
  }
}
