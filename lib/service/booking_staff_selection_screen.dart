import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/models/shop_card_model.dart';
import 'package:flutter/material.dart';

class BookingStaffSelectionScreen extends StatelessWidget {
  final VoidCallback onNext;

  const BookingStaffSelectionScreen({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 16 * 2 - 8) / 2;

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
                  children: List.generate(dummyShopCardList.length, (index) {
                    final item = dummyShopCardList[index];
                    return SizedBox(
                      width: itemWidth,
                      height: 250,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: onNext,
                        child: StaffCardWidget(item: item),
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

  final ShopCardModel item;

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
          children: [
            const SizedBox(height: 4),
            Image.asset(
              item.images,
              height: 140,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 8),
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
                item.email ?? 'yourmailaas@mail.com',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 28),
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
