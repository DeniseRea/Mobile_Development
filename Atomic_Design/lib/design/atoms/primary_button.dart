import 'package:flutter/material.dart';
import 'colors.dart';

/// PrimaryButton: Átomo para botón principal reutilizable
/// 
/// Propiedades:
/// - text: texto que muestra el botón
/// - onPressed: función que se ejecuta al presionar
/// 
/// Ejemplo:
///   PrimaryButton(text: "Ingresar", onPressed: () { })
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

