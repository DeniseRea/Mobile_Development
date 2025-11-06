import 'package:flutter/material.dart';
import '../atoms/colors.dart';

/// BaseTemplate: Plantilla base con AppBar y estructura común
/// 
/// Propiedades:
/// - title: título de la página en el AppBar
/// - child: contenido principal de la página
/// - actions: acciones opcionales en el AppBar (ej: botones)
/// 
/// Ejemplo:
///   BaseTemplate(
///     title: "Mi Página",
///     child: Center(child: Text("Contenido aquí")),
///     actions: [IconButton(icon: Icon(Icons.menu), onPressed: (){})],
///   )
class BaseTemplate extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;

  const BaseTemplate({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        actions: actions,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: child,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
