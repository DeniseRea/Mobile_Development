import 'package:flutter/material.dart';
import '../atoms/theme_Colors.dart';
import '../atoms/spacing_tokens.dart';
import '../atoms/text_label.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final bool centerTitle;

  const Header({
    Key? key,
    required this.title,
    this.elevation = 2,
    this.backgroundColor,
    this.titleStyle,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Headline(
        title,
        fontSize: FontSize.xl.toDouble(),
        fontWeight: FontWeight.w700,
      ),
      elevation: elevation,
      backgroundColor: backgroundColor ?? Colors.white,
      centerTitle: centerTitle,
      shadowColor: Colors.black.withOpacity(0.1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

