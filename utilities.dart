import 'package:flutter/material.dart';

int createUniqueID() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

class NotificationWeekAndTime {
  final int dayofTheWeek;
  final TimeOfDay timeOfDay;

  NotificationWeekAndTime({
    required this.dayofTheWeek,
    required this.timeOfDay,
  });
}

Future<NotificationWeekAndTime?> pickSchedule( 
  BuildContext context,
  async {
    List<String> weekdays = [
      'Mon',
      'Tues',
      'Wed',
      'Thurs',
      'Fri',
      'Sat',
      'Sun',
    ]};
    TimeOfDay? timeOfDay; 
    DateTime now = DateTime.now();
    int? selectedDay; 

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'I want to be reminded every: ',
            textAlign. TextAlign.center,
          ),
          content: Wrap(
            alignment: WrapAlignment.center,
            spacing: 3,
            children: [
              for (int index = 0; index < weekdays.length; index++)
                ElevatedButton(
                  onPressed: () {
                    selectedDay = index + 1;
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.teal,
                    ),
                  ),
                  child: Text(weekdays[index]),
                ),
            ],
          ),
        ),
      },
      if (selectedDay != null) {
        timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
            now.add(
              Duration(minutes: 1),
            ),
          ),
          builder: (BuildContext context, Widget? chld) {
            return Theme(
              data: ThemeData(
                colorScheme: ColorsScheme.light(
                  primary: Colors.teal,
                ),
              ),
              child: child!,
            );
          )};

          if (timeOfDay != null) {
            return NotificationWeekAndTime( 
              dayofTheWeek: selectedDay!, timeOfDay: timeOfDay);
            )
          }
          return null; 
      }
    );

)
