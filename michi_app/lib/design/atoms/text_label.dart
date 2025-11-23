import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;

  const TextLabel(
    this.text, {
    Key? key,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black87,
      ),
    );
  }
}

class Headline extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;

  const Headline(
    this.text, {
    Key? key,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w700,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      ),
    );
  }
}

