import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final double? imageSize;

  const CustomCardWidget({
    super.key,
    required this.imagePath,
    required this.text,
    this.width,
    this.height = 50,
    this.onTap,
    this.imageSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          children: [
            // PNG Image
            Image.asset(
              imagePath,
              width: imageSize,
              height: imageSize,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.image_not_supported,
                  size: imageSize,
                  color: Colors.grey,
                );
              },
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
