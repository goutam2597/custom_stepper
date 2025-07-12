import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/models/service_card_model.dart';
import 'package:flutter/material.dart';

// Call this like:
// BookingStaffSelectionScreen(
//   onStaffSelected: (staff) { ... },
//   serviceCardModel: selectedService,
// );

class BookingStaffSelectionScreen extends StatelessWidget {
  final ValueChanged<StaffModel> onStaffSelected; // Passes selected staff
  final ServiceCardModel serviceCardModel;

  const BookingStaffSelectionScreen({
    super.key,
    required this.onStaffSelected,
    required this.serviceCardModel,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 16 * 2 - 8) / 2;
    final staffList = serviceCardModel.staffs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: BookingHeaderTextWidget(text: 'Choose Your Staff'),
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 24,
                  children: List.generate(staffList.length, (index) {
                    final staff = staffList[index];
                    return SizedBox(
                      width: itemWidth,
                      height: 280,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => onStaffSelected(staff),
                        child: StaffCardWidget(item: staff),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StaffCardWidget extends StatelessWidget {
  const StaffCardWidget({super.key, required this.item});

  final StaffModel item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(item.staffImage),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                item.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                item.staffEmail,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        Positioned(
          bottom: -20,
          left: 20,
          right: 20,
          child: SizedBox(
            width: double.infinity,
            child: Material(
              borderRadius: BorderRadius.circular(6),
              elevation: 0.1,
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.center,
                child: const Text(
                  'Select Staff',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
