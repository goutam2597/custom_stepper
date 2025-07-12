import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class FormHeaderTextWidget extends StatelessWidget {
  final String text;
  const FormHeaderTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.colorText,
      ),
    );
  }
}
