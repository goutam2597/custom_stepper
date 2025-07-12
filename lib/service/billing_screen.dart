import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/common/booking_text_button_widget.dart';
import 'package:book_app/common/form_header_text_widget.dart';
import 'package:book_app/models/service_card_model.dart';
import 'package:flutter/material.dart';

class BillingScreen extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedSlot;

  const BillingScreen({
    super.key,
    required this.onBack,
    required this.onNext,
    required this.serviceCardModel,
    required this.selectedStaff,
    required this.selectedDate,
    required this.selectedSlot,
  });

  @override
  Widget build(BuildContext context) {
    String? formattedDate = selectedDate != null
        ? "${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}"
        : null;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: BookingHeaderTextWidget(text: 'Billing Details'),
                      ),
                      const SizedBox(height: 32),
                      // ---- Form fields ----
                      const FormHeaderTextWidget(text: 'Full Name*'),
                      const SizedBox(height: 4),
                      const TextField(),
                      const SizedBox(height: 16),

                      const FormHeaderTextWidget(text: 'Phone Number*'),
                      const SizedBox(height: 4),
                      const TextField(),
                      const SizedBox(height: 16),

                      const FormHeaderTextWidget(text: 'Email Address*'),
                      const SizedBox(height: 4),
                      const TextField(),
                      const SizedBox(height: 16),

                      const FormHeaderTextWidget(text: 'Address*'),
                      const SizedBox(height: 4),
                      const TextField(),
                      const SizedBox(height: 16),

                      const Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormHeaderTextWidget(text: 'Postcode/Zip'),
                                SizedBox(height: 4),
                                TextField(),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormHeaderTextWidget(text: 'Country'),
                                SizedBox(height: 4),
                                TextField(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BookingTextButtonWidget(
                            onTap: onBack,
                            text: 'Previous Step',
                            icon: Icons.arrow_back,
                          ),
                          BookingTextButtonWidget(
                            onTap: onNext,
                            text: 'Next Step',
                            icon: Icons.arrow_forward,
                            iconRight: true,
                            textColor: AppColors.themeColor,
                            iconColor: AppColors.themeColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
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

  Widget _summaryLine(String title, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Row(
      children: [
        Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
            )),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
      ],
    ),
  );
}
