import 'package:flutter/material.dart';
import 'colors.dart';


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
        backgroundColor: AppColors.secondary, // Color principal (puedes cambiarlo)
        minimumSize: const Size(double.infinity, 48), // Ancho completo
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Bordes suaves
        ),
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
