import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscure;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int maxLines;

  const AppInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.obscure = false,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          maxLines: _obscureText ? 1 : widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey.shade400),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFB7A6FA), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red.shade400),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red.shade400, width: 2),
            ),
            suffixIcon: widget.obscure
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey.shade500,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
          validator: widget.validator ?? (_) => null,
        ),
      ],
    );
  }
}

