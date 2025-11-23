import 'package:flutter/material.dart';

class SnackbarHelper {
  static void showError(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.red.shade600,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  static void showSuccess(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.green.shade600,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  static void showInfo(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        backgroundColor: Colors.blue.shade600,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
      ),
    );
  }
}

