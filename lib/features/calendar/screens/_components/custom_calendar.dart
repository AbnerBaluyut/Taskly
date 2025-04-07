import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taskly/core/extensions/context_extension.dart';

import '../../../../core/styles/custom_colors.dart';

class CustomCalendar extends StatefulWidget {

  const CustomCalendar({
    super.key,
    required this.onSelectedDate,
  });
  
  final void Function(DateTime date) onSelectedDate;

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    
    return TableCalendar(
      availableGestures: AvailableGestures.horizontalSwipe,
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(3000, 3, 14),
      selectedDayPredicate: (day) {
        return isSameDay(day, _selectedDay);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          if (selectedDay == focusedDay) {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          } else {
            _focusedDay = selectedDay;
            _selectedDay = selectedDay;
          }
        });
        widget.onSelectedDate.call(_selectedDay);
      },
      daysOfWeekHeight: 30.0,
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(
          color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
          fontSize: 20.0,
          fontWeight: FontWeight.w500
        ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: CustomColors.primaryColor,
          size: 24.0,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: CustomColors.primaryColor,
          size: 24.0,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),
        weekendStyle: TextStyle(
          color: Colors.grey.shade500,
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),
      ),
      calendarStyle: CalendarStyle(
        defaultDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3.0),
        ),
        weekendDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3.0),
        ),
        outsideDecoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(3.0),
        ),
        selectedDecoration: BoxDecoration(
          color: CustomColors.primaryColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(3.0),
        ),
        todayDecoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
        ),
        todayTextStyle: TextStyle(
          color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),
        outsideTextStyle: TextStyle(
          color: context.isDarkMode() ? Colors.grey.shade600 : Colors.grey.shade400,
          fontSize: 14.0,
          fontWeight: FontWeight.w500
        ),
        defaultTextStyle: TextStyle(
          color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
          fontSize: 14.0,
          fontWeight: FontWeight.w500
        ),
        weekendTextStyle: TextStyle(
          color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
          fontSize: 14.0,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}