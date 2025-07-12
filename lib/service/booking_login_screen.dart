import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/common/booking_text_button_widget.dart';
import 'package:book_app/common/login_screen_widget.dart';
import 'package:book_app/models/service_card_model.dart';
import 'package:flutter/material.dart';

class BookingLoginScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedSlot;

  const BookingLoginScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.serviceCardModel,
    required this.selectedStaff,
    required this.selectedDate,
    required this.selectedSlot,
  });

  @override
  Widget build(BuildContext context) {
    // You can use the data here (e.g., show summary or pass it further)
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 48),
                      const BookingHeaderTextWidget(text: 'Login'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          maximumSize: const Size(304, 44),
                          backgroundColor: Colors.white,
                          textStyle: const TextStyle(
                            color: AppColors.themeColor,
                          ),
                        ),
                        onPressed: () {
                          // If you want to proceed as guest, call onNext()
                          onNext();
                        },
                        child: const Text(
                          'Proceed As Guest Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      LoginScreenWidget(onTap: onNext),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 164,
                        child: BookingTextButtonWidget(
                          onTap: onBack,
                          icon: Icons.arrow_back,
                          text: 'Previous Step',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
