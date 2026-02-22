import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:up_todo/core/utils/extensions/context_extension.dart';
import 'package:up_todo/shared/components/custom_button.dart';

class CustomCalendarDialog extends StatefulWidget {
  const CustomCalendarDialog({super.key});

  @override
  State<CustomCalendarDialog> createState() => _CustomCalendarDialogState();
}

class _CustomCalendarDialogState extends State<CustomCalendarDialog> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: context.typography.subtitle4Bold,
                weekendStyle: context.typography.subtitle4Bold.copyWith(
                  color: Colors.red,
                ),
              ),
              firstDay: DateTime(2000),
              lastDay: DateTime(2100),
              focusedDay: focusedDay,
              selectedDayPredicate: (day) => isSameDay(selectedDay, day),
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: context.colors.strokeColor,
                      width: 1,
                    ),
                  ),
                ),
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: context.typography.body2SemiBold,
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
              calendarStyle: CalendarStyle(
                tablePadding: EdgeInsets.only(top: 12),
                defaultTextStyle: context.typography.subtitle4Bold,
                selectedDecoration: BoxDecoration(
                  color: context.colors.primary,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  shape: BoxShape.circle,
                ),
              ),
              onDaySelected: (selected, focused) {
                setState(() {
                  selectedDay = selected;
                  focusedDay = focused;
                });
              },
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomButton(
                    color: Colors.transparent,
                    textColor: context.colors.primary,
                    text: 'Cancel',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                6.horizontalSpace,
                Expanded(
                  child: CustomButton(
                    text: 'Choose Time',
                    onTap: () {
                      Navigator.pop(context, selectedDay);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
