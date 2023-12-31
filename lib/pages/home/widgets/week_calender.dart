import 'package:al_qamar/constants/colors.dart';
import 'package:al_qamar/utils/extensions/datetime.dart';
import 'package:al_qamar/utils/rtl_direct.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeekCalender extends StatelessWidget {
  const WeekCalender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: CheckDirect.isRTL(context) ? 'ar_IQ' : 'en_Uk',
      focusedDay: DateTime.now(),
      availableGestures: AvailableGestures.none,
      firstDay: DateTime(2000, 1, 1),
      lastDay: DateTime(2100, 1, 1),
      calendarFormat: CalendarFormat.week,
      currentDay: DateTime.now(),
      headerVisible: false,
      daysOfWeekHeight: 30,
      weekendDays: const [DateTime.friday, DateTime.saturday],
      calendarBuilders: CalendarBuilders(
        outsideBuilder: (context, day, focusedDay) => Container(
          alignment: Alignment.center,
          child: Text(
            '${CheckDirect.isRTL(context) ? day.getHijriDate() : day.day}',
            style: TextStyle(
              color: day.weekday == DateTime.friday ||
                      day.weekday == DateTime.saturday
                  ? AppColors.red
                  : AppColors.grey,
              fontSize: 12,
            ),
          ),
        ),
        defaultBuilder: (context, day, focusedDay) => Container(
          alignment: Alignment.center,
          child: Text(
            '${CheckDirect.isRTL(context) ? day.getHijriDate() : day.day}',
            style: TextStyle(
              fontSize: 12,
              color: day.weekday == DateTime.friday ||
                      day.weekday == DateTime.saturday
                  ? AppColors.red
                  : AppColors.grey,
            ),
          ),
        ),
        todayBuilder: (context, day, focusedDay) => Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            '${CheckDirect.isRTL(context) ? focusedDay.getHijriDate() : focusedDay.day}',
            style: TextStyle(
              color: day.weekday == DateTime.friday ||
                      day.weekday == DateTime.saturday
                  ? AppColors.red
                  : AppColors.blue,
              fontSize: 12,
            ),
          ),
        ),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          fontSize: 12,
          color: AppColors.grey,
        ),
        weekendStyle: TextStyle(
          fontSize: 12,
          color: AppColors.red,
        ),
      ),
    );
  }
}
