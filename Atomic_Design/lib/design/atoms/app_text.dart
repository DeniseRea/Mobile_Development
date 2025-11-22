import 'package:flutter/material.dart';

/// AppText: átomo para texto con estilos reutilizables.
/// Uso: AppText('Hola', size: 18, weight: FontWeight.w600);
class AppText extends StatelessWidget {
  // Texto que se mostrará (inmutable).
  final String text;

  // Opciones de estilo que se puede pasar.
  final double size;
  final FontWeight weight;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;

  // Constructor
  const AppText(
      this.text, {
        super.key,
        this.size = 16.0,
        this.weight = FontWeight.normal,
        this.color,
        this.align,
        this.maxLines,
        this.overflow,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
      ),
    );
  }
}
