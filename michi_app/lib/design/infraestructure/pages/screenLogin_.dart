import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:michi_app/authProvider.dart';

import '../../../authProvider.dart';
import '../templates/login_.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return; // valida UI antes de login
    final auth = context.read<AuthProvider>();
    if (auth.isLoading) return;

    final success = await auth.login(
      emailController.text.trim(),
      passwordController.text,
    );

    if (success) {
      if (mounted) Navigator.of(context).pushReplacementNamed('/home');
    } else {
      final message = auth.errorMessage ?? 'Error de inicio de sesión';
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    return TempLogin(
      formKey: _formKey,
      emailController: emailController,
      passwordController: passwordController,
      isLoading: auth.isLoading,
      errorMessage: auth.errorMessage,
      onSubmit: () => _handleLogin(),
    );
  }
}