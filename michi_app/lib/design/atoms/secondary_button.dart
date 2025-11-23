import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;

  const SecondaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          side: BorderSide(
            color: textColor ?? Colors.grey.shade400,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? Colors.grey.shade600,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

