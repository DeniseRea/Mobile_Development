import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String source; // URL o asset path
  final double width;
  final double height;
  final bool isAsset;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const Avatar({
    Key? key,
    required this.source,
    this.width = 120,
    this.height = 120,
    this.isAsset = true,
    this.fit = BoxFit.cover,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(16),
      child: SizedBox(
        width: width,
        height: height,
        child: isAsset
            ? Image.asset(
                source,
                fit: fit,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              )
            : Image.network(
                source,
                fit: fit,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

