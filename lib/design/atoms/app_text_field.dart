import 'package:atomic_design/design/atoms/colors.dart';
import 'package:flutter/material.dart';


class AppTextField extends StatelessWidget {
  final String hint;
  final bool obscure;


  const AppTextField({super.key, required this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.gray),
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.background),
        ),
      ),

    );
  }
}
