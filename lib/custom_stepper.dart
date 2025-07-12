import 'package:book_app/common/custom_app_bar.dart';
import 'package:book_app/service/billing_screen.dart';
import 'package:book_app/service/booking_login_screen.dart';
import 'package:book_app/service/booking_staff_selection_screen.dart';
import 'package:book_app/service/date_n_time_screen.dart';
import 'package:book_app/service/payment_screen.dart';
import 'package:book_app/service/payment_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_app/models/service_card_model.dart';

class StepperScreen extends StatefulWidget {
  final ServiceCardModel selectedService;

  const StepperScreen({super.key, required this.selectedService});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int activeStep = 1;
  int currentSubScreen = 0; // 0: login, 1: billing, 2: payment

  void _goToNextStep() {
    if (activeStep == 1) {
      setState(() => activeStep = 2);
    } else if (activeStep == 2) {
      setState(() {
        activeStep = 3;
        currentSubScreen = 0;
      });
    } else if (activeStep == 3) {
      if (currentSubScreen < 2) {
        setState(() => currentSubScreen++);
      } else {
        setState(() => activeStep = 4);
      }
    }
  }

  void _goToPreviousStep() {
    if (activeStep == 2) {
      setState(() => activeStep = 1);
    } else if (activeStep == 3) {
      if (currentSubScreen > 0) {
        setState(() => currentSubScreen--);
      } else {
        setState(() => activeStep = 2);
      }
    } else if (activeStep == 4) {
      setState(() {
        activeStep = 3;
        currentSubScreen = 2;
      });
    } else {
      Navigator.pop(context);
    }
  }

  Widget _getCurrentScreen() {
    // Pass the data down to each screen that needs it
    if (activeStep == 1) {
      return BookingStaffSelectionScreen(
        onNext: _goToNextStep,
        serviceCardModel: widget.selectedService, // Pass your data
      );
    } else if (activeStep == 2) {
      return DateNTimeScreen(
        onNext: _goToNextStep,
        onBack: _goToPreviousStep,
        serviceCardModel: widget.selectedService, // Pass your data
      );
    } else if (activeStep == 3) {
      switch (currentSubScreen) {
        case 0:
          return BookingLoginScreen(
            onNext: _goToNextStep,
            onBack: _goToPreviousStep,
            serviceCardModel: widget.selectedService, // Pass your data
          );
        case 1:
          return BillingScreen(
            onNext: _goToNextStep,
            onBack: _goToPreviousStep,
            serviceCardModel: widget.selectedService, // Pass your data
          );
        case 2:
          return PaymentScreen(
            onBack: _goToPreviousStep,
            onPaymentComplete: () => setState(() => activeStep = 4),
            serviceCardModel: widget.selectedService,
          );
      }
    } else if (activeStep == 4) {
      return PaymentConfirmationScreen(
        onBackToHome: () =>
            Navigator.popUntil(context, (route) => route.isFirst),
        serviceCardModel: widget.selectedService, // Pass your data
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final int stepDisplayIndex = activeStep == 4
        ? 5
        : (activeStep == 3 && currentSubScreen == 2)
        ? 4
        : activeStep;

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Service Booking'),
          const SizedBox(height: 16),
          CustomStepper(activeStep: stepDisplayIndex),
          const SizedBox(height: 8),
          Expanded(child: _getCurrentScreen()),
        ],
      ),
    );
  }
}

class CustomStepper extends StatelessWidget {
  final int activeStep;

  const CustomStepper({super.key, required this.activeStep});

  static const double _circleDiameter = 36.0;
  static const double _lineWidth = 5;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {'label': 'Staff', 'isCompleted': activeStep > 1},
      {'label': 'Date & Time', 'isCompleted': activeStep > 2},
      {'label': 'Information', 'isCompleted': activeStep > 3},
      {'label': 'Payment', 'isCompleted': activeStep > 4},
    ];

    return SizedBox(
      height: 61,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: _circleDiameter / 2 - _lineWidth / 2,
            left: _circleDiameter / 0.5,
            right: _circleDiameter / 0.5,
            child: Container(height: _lineWidth, color: Colors.grey.shade300),
          ),
          Row(
            children: steps.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> step = entry.value;
              return Expanded(
                child: _buildStep(
                  label: step['label'],
                  isCompleted: step['isCompleted'],
                  isActive: activeStep == index + 1,
                  number: '${index + 1}',
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required String label,
    required bool isCompleted,
    required bool isActive,
    required String number,
  }) {
    final Color circleColor = isCompleted
        ? const Color(0xFF5CB85C)
        : Colors.white;
    final Color borderColor = isCompleted
        ? const Color(0xFF5CB85C)
        : Colors.grey.shade400;
    final Color labelColor = isActive
        ? const Color(0xFF3F51B5)
        : Colors.black54;
    final FontWeight labelWeight = isActive
        ? FontWeight.bold
        : FontWeight.normal;

    final Widget child = isCompleted
        ? const Icon(Icons.check, color: Colors.white, size: 20)
        : Text(
            number,
            style: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _circleDiameter,
          height: _circleDiameter,
          decoration: BoxDecoration(
            color: circleColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Center(child: child),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: labelColor,
            fontWeight: labelWeight,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
