import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/common/booking_text_button_widget.dart';
import 'package:book_app/common/custom_elevated_button.dart';
import 'package:book_app/models/service_card_model.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final VoidCallback onBack;
  final void Function(String paymentMethod) onPaymentComplete;
  final ServiceCardModel serviceCardModel;
  final StaffModel? selectedStaff;
  final DateTime? selectedDate;
  final String? selectedSlot;

  const PaymentScreen({
    super.key,
    required this.onBack,
    required this.onPaymentComplete,
    required this.serviceCardModel,
    required this.selectedStaff,
    required this.selectedDate,
    required this.selectedSlot,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedPaymentMethod;

  final List<String> paymentMethods = [
    'PayPal',
    'Instamojo',
    'Paystack',
    'Flutterwave',
    'Razorpay',
    'MercadoPago',
    'Mollie',
    'Stripe',
    'Paytm',
    'Authorize.net',
    'Bank of America',
    'Citibank',
  ];

  @override
  Widget build(BuildContext context) {
    String? formattedDate = widget.selectedDate != null
        ? "${widget.selectedDate!.year}-${widget.selectedDate!.month.toString().padLeft(2, '0')}-${widget.selectedDate!.day.toString().padLeft(2, '0')}"
        : null;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const BookingHeaderTextWidget(
                      text: 'Select Payment Method',
                    ),
                    const SizedBox(height: 24),
                    Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          borderRadius: BorderRadius.circular(12),
                          dropdownColor: Colors.white,
                          hint: const Text('Choose a Payment Method'),
                          value: selectedPaymentMethod,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value;
                            });
                          },
                          items: paymentMethods.map((method) {
                            return DropdownMenuItem<String>(
                              value: method,
                              child: Text(method),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 56,
                      child: CustomElevatedButton(
                        text: 'Make Payment',
                        onPressed: () {
                          if (selectedPaymentMethod != null) {
                            widget.onPaymentComplete(selectedPaymentMethod!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a payment method'),
                              ),
                            );
                          }
                        },
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 16),
                    BookingTextButtonWidget(
                      onTap: widget.onBack,
                      text: 'Previous Step',
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
}
