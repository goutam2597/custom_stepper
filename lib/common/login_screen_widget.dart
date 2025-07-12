import 'package:book_app/common/custom_elevated_button.dart';
import 'package:book_app/common/form_header_text_widget.dart';
import 'package:flutter/material.dart';

class LoginScreenWidget extends StatelessWidget {
  final VoidCallback onTap;
  const LoginScreenWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FormHeaderTextWidget(text: 'Username*'),
        const SizedBox(height: 4),
        const TextField(),
        const SizedBox(height: 24),
        const FormHeaderTextWidget(text: 'Password*'),
        const SizedBox(height: 4),
        const TextField(),
        const SizedBox(height: 32),
        CustomElevatedButton(
          text: 'Login',
          onPressed: onTap,
          padding: const EdgeInsets.symmetric(vertical: 16),
          fontSize: 18,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade600,

              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Sign Up')),
          ],
        ),
      ],
    );
  }
}
