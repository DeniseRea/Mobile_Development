import 'package:atomic_design/design/atoms/colors.dart';
import 'package:flutter/material.dart';

/// AppTextField: Átomo para campo de entrada con estilos personalizados
/// 
/// Propiedades:
/// - hint: texto de ayuda del campo
/// - obscure: oculta el texto (ej: contraseñas)
/// - controller: controla el valor del campo
/// - onChanged: callback cuando cambia el valor
/// 
/// Ejemplo:
///   AppTextField(hint: "Email", obscure: false)
///   AppTextField(hint: "Contraseña", obscure: true)
class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;


  const AppTextField({
    super.key,
    required this.hint,
    this.obscure = false,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.gray.withOpacity(0.6)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.secondary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.secondary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
