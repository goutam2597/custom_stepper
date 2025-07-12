import 'package:book_app/app/app_colors.dart';
import 'package:book_app/common/booking_header_text_widget.dart';
import 'package:book_app/common/booking_text_button_widget.dart';
import 'package:book_app/models/service_card_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateNTimeScreen extends StatefulWidget {
  final void Function(DateTime date, String slot) onNext;
  final VoidCallback onBack;
  final ServiceCardModel serviceCardModel;

  const DateNTimeScreen({
    super.key,
    required this.onNext,
    required this.onBack,
    required this.serviceCardModel,
  });

  @override
  State<DateNTimeScreen> createState() => _DateNTimeScreenState();
}

class _DateNTimeScreenState extends State<DateNTimeScreen> {
  DateTime? selectedDate;
  int? selectedSlotIndex;

  // Dynamic time slots for specific dates (yyyy-mm-dd)
  final Map<String, List<String>> slotsByDate = {
    "2025-07-13": ["01:00-03:00", "03:00-05:00", "05:00-07:00"],
    "2025-07-14": ["09:00-10:00", "11:00-12:00"],
    "2025-07-15": ["10:00-11:00", "12:00-13:00", "18:00-20:00"],
    // ...add more date-slot lists as needed
  };

  bool isHoliday(DateTime date) =>
      date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

  List<String> getSlotsForSelectedDate() {
    if (selectedDate == null || isHoliday(selectedDate!)) return [];
    final key =
        "${selectedDate!.year.toString().padLeft(4, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}";
    return slotsByDate[key] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final timeSlots = getSlotsForSelectedDate();
    return SafeArea(
      child: Column(
        children: [
          const BookingHeaderTextWidget(text: 'Select Date & Time'),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: selectedDate ?? DateTime.now(),
            selectedDayPredicate: (day) =>
            selectedDate != null &&
                day.year == selectedDate!.year &&
                day.month == selectedDate!.month &&
                day.day == selectedDate!.day,
            onDaySelected: (selected, focused) {
              setState(() {
                selectedDate = selected;
                selectedSlotIndex = null; // Reset slot on new date
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                if (isHoliday(day)) {
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
                if (isHoliday(day)) {
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
          const SizedBox(height: 24),
          if (selectedDate != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22.0, bottom: 8),
                  child: Text(
                    "Available Time Slots",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            if (isHoliday(selectedDate!))
              const Padding(
                padding: EdgeInsets.only(left: 22, top: 12, bottom: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Holiday! No slots available.",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            else if (timeSlots.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    timeSlots.length,
                        (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ChoiceChip(
                        label: Text(
                          timeSlots[index],
                          style: TextStyle(
                            color: selectedSlotIndex == index
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                        selected: selectedSlotIndex == index,
                        selectedColor: AppColors.themeColor,
                        backgroundColor: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: selectedSlotIndex == index
                                ? AppColors.themeColor
                                : Colors.grey.shade300,
                          ),
                        ),
                        onSelected: (_) {
                          setState(() {
                            selectedSlotIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              )
            else
              const Padding(
                padding: EdgeInsets.only(left: 22, top: 12, bottom: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "No slots available for this date.",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
          ],
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BookingTextButtonWidget(
                onTap: widget.onBack,
                text: 'Previous Step',
                icon: Icons.arrow_back,
              ),
              BookingTextButtonWidget(
                iconRight: true,
                onTap: () {
                  if (selectedDate == null || selectedSlotIndex == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a date and time slot!")),
                    );
                    return;
                  }
                  final selectedSlot = getSlotsForSelectedDate()[selectedSlotIndex!];
                  widget.onNext(selectedDate!, selectedSlot);
                },
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
