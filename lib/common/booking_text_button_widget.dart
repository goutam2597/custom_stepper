import 'package:flutter/material.dart';

class BookingTextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;
  final bool iconRight;
  final Color? textColor;
  final Color? iconColor;
  final FontWeight? fontWeight;

  const BookingTextButtonWidget({
    super.key,
    required this.onTap,
    required this.text,
    required this.icon,
    this.iconRight = false,
    this.textColor,
    this.iconColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: iconRight
            ? [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    color: textColor ?? Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(icon, color: iconColor ?? Colors.grey.shade600, size: 22),
              ]
            : [
                Icon(icon, color: Colors.grey.shade600, size: 22),
                const SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    color: textColor ?? Colors.grey.shade600,
                  ),
                ),
              ],
      ),
    );
  }
}
