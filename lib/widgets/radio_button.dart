import 'package:flutter/material.dart';

Widget buildCustomRadioButton({
  required String label,
  required bool isSelected,
  required VoidCallback onTap,
  required double size,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        // The Double Circle (Custom Radio)
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey,
              width: 1,
            ),
          ),
          child: Center(
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // Inner circle is filled only if selected
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        // The Text
        Text(
          label,
          style: TextStyle(
            fontSize: size,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w400,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ],
    ),
  );
}
