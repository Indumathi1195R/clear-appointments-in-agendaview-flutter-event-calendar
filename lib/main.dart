import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(AppointmentClear());

class AppointmentClear extends StatefulWidget {
  @override
  AppointmentClearState createState() => AppointmentClearState();
}

class AppointmentClearState extends State<AppointmentClear> {
  CalendarController _calendarController;

  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
              child: SfCalendar(
                view: CalendarView.month,
                controller: _calendarController,
                dataSource: _getDataSource(),
                onViewChanged: calendarViewChanged,
                monthViewSettings: MonthViewSettings(showAgenda: true),
              ),
            )));
  }

  void calendarViewChanged(ViewChangedDetails viewChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _calendarController.selectedDate=null;
    });
  }
}

_DataSource _getDataSource() {
  final List<Appointment> appointments = <Appointment>[];
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(hours: 4)),
    endTime: DateTime.now().add(Duration(hours: 5)),
    subject: 'Meeting',
    color: Colors.red,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: -2, hours: 4)),
    endTime: DateTime.now().add(Duration(days: -2, hours: 5)),
    subject: 'Development Meeting   New York, U.S.A',
    color: Color(0xFFf527318),
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: -2, hours: 3)),
    endTime: DateTime.now().add(Duration(days: -2, hours: 4)),
    subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
    color: Color(0xFFfb21f66),
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: -2, hours: 2)),
    endTime: DateTime.now().add(Duration(days: -2, hours: 3)),
    subject: 'Support - Web Meeting   Dubai, UAE',
    color: Color(0xFFf3282b8),
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(days: -2, hours: 1)),
    endTime: DateTime.now().add(Duration(days: -2, hours: 2)),
    subject: 'Project Release Meeting   Istanbul, Turkey',
    color: Color(0xFFf2a7886),
  ));
  appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
      endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
      subject: 'Release Meeting',
      color: Colors.lightBlueAccent,
      isAllDay: true));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
    endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
    subject: 'Performance check',
    color: Colors.amber,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
    endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
    subject: 'Customer Meeting   Tokyo, Japan',
    color: Color(0xFFffb8d62),
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
    endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
    subject: 'Retrospective',
    color: Colors.purple,
  ));

  return _DataSource(appointments);
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
