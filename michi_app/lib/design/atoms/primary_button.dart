import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool enabled;
  final double? width;
  final double height;
  final Color? backgroundColor;
  final Color? textColor;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.enabled = true,
    this.width,
    this.height = 48,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: enabled ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: enabled
              ? (backgroundColor ?? const Color(0xFFB7A6FA))
              : Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: enabled ? 4 : 0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

