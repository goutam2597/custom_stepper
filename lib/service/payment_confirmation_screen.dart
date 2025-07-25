import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/common/booking_text_button_widget.dart';
import 'package:book_app/custom_stepper.dart';
import 'package:book_app/models/service_card_model.dart';
import 'package:flutter/material.dart';

class PaymentConfirmationScreen extends StatelessWidget {
  final VoidCallback onBackToHome;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedSlot;
  final String? selectedPayment;

  const PaymentConfirmationScreen({
    super.key,
    required this.onBackToHome,
    required this.serviceCardModel,
    required this.selectedStaff,
    required this.selectedDate,
    required this.selectedSlot,
    this.selectedPayment,
  });

  @override
  Widget build(BuildContext context) {
    String formattedDate = selectedDate != null
        ? "${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}"
        : "-";

    final bookingDetails = <String, String>{
      'Service Title:': serviceCardModel.title,
      'Booking Date:': formattedDate,
      'Appointment Date:': formattedDate,
      'Appointment Time:': selectedSlot ?? "-",
      'Vendor:': selectedStaff?.name ?? "-",
      'Paid Amount:': serviceCardModel.discountedPrice,
      'Paid By:': selectedPayment ?? '',
      'Payment Status:': 'Completed',
    };

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const BookingHeaderTextWidget(text: 'Payment Confirmation'),
                    const SizedBox(height: 16),
                    _buildConfirmationHeader(),
                    const SizedBox(height: 24),
                    _buildBookingDetails(bookingDetails),
                    const SizedBox(height: 16),
                    BookingTextButtonWidget(
                      onTap: onBackToHome,
                      text: 'Back to Home',
                      icon: Icons.arrow_back,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmationHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _headerText('Your'),
            _headerText(
              '( ${serviceCardModel.category} )',
              bold: true,
              color: AppColors.themeColor,
            ),
            _headerText('Service is Booked'),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Booking ID: 12389',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.colorText,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Thank You',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _headerText(
    String text, {
    bool bold = false,
    Color color = const Color(0xFF757575),
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
          color: color,
        ),
      ),
    );
  }

  Widget _buildBookingDetails(Map<String, String> details) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          const BookingHeaderTextWidget(text: 'Booking Details'),
          const SizedBox(height: 4),
          Divider(color: Colors.grey.shade300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: details.entries
                        .map(
                          (entry) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: _bookingDetailText(entry.key),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: details.entries
                        .map(
                          (entry) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: _bookingDetailText(entry.value),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bookingDetailText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
    );
  }
}
