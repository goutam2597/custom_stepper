import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/common/booking_text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateNTimeScreen extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const DateNTimeScreen({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const BookingHeaderTextWidget(text: 'Select Date & Time'),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (day.weekday == DateTime.saturday ||
                    day.weekday == DateTime.sunday) {
                  return Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return null;
              },
              todayBuilder: (context, day, focusedDay) {
                if (day.weekday == DateTime.saturday ||
                    day.weekday == DateTime.sunday) {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.all(32),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Time Slots will be here'),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookingTextButtonWidget(
                onTap: onBack,
                text: 'Previous Step',
                icon: Icons.arrow_back,
              ),
              BookingTextButtonWidget(
                iconRight: true,
                onTap: onNext,
                text: 'Next Step',
                icon: Icons.arrow_forward,
                iconColor: AppColors.themeColor,
                textColor: AppColors.themeColor,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
