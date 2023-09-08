import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayCalenderWidget extends StatelessWidget {
  const TodayCalenderWidget({
    super.key,
    required this.todayController,
  });

  final DateTime todayController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 29, right: 20),
      child: SizedBox(
        // color: cWhite.withOpacity(0.4),
        height: 400,
        width: 500,
        child: TableCalendar(
          locale: 'en_US',
          rowHeight: 43,
          focusedDay: todayController,
          firstDay: DateTime.utc(2000, 10, 16),
          lastDay: DateTime.utc(2050, 3, 14),
        ),
      ),
    );
  }
}