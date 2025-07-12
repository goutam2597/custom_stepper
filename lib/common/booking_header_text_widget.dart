
import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class BookingHeaderTextWidget extends StatelessWidget {
  final String text;
  const BookingHeaderTextWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.colorText,
      ),
    );
  }
}
