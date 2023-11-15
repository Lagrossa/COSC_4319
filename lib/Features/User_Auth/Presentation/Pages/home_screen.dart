import 'package:addvisor/components/addtracker.dart';
import 'package:addvisor/components/alertbox_dialog.dart';
import 'package:addvisor/components/drawer_nav.dart';
import 'package:addvisor/components/habitBox.dart';
import 'package:addvisor/components/habit_heat_map.dart';
import 'package:addvisor/components/homeBoxes.dart';
import 'package:addvisor/components/nav_bar.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List habitList = [];

  void tapCheckBox(bool? val, int index) {
    setState(() {
      habitList[index][1] = val;
    });
  }

  final newHabitNameController = TextEditingController();

  void createHabit() {
    showDialog(
      context: this.context,
      builder: (context) {
        return AlertboxDialog(
          controller: newHabitNameController,
          hintText: 'Enter Habit Name!',
          save: saveNewHabit,
          cancel: cancelHabitBox,
        );
      },
    );
  }

  void saveNewHabit() {
    setState(() {
      habitList.add([newHabitNameController.text, false]);
    });
    newHabitNameController.clear();
    Navigator.of(context as BuildContext).pop();
  }

  void cancelHabitBox() {
    newHabitNameController.clear();
    Navigator.of(context as BuildContext).pop();
  }

  void openHabitEdit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertboxDialog(
          controller: newHabitNameController,
          hintText: habitList[index][0],
          save: () => saveExistingHabit(index),
          cancel: cancelHabitBox,
        );
      },
    );
  }

  void saveExistingHabit(int index) {
    setState(() {
      habitList[index][0] = newHabitNameController.text;
    });
    Navigator.pop(context);
    newHabitNameController.clear();
  }

  void deleteHabit(int index) {
    setState(() {
      habitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.background,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 40,
          elevation: 0,
          backgroundColor: ThemeColors.background,
          automaticallyImplyLeading: false,
          title: Text(
            "Welcome Back, \nUsername",
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Lexend',
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.white,
                ),
          ),
        ),
        drawer: DrawerNav(),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                child: EasyInfiniteDateTimeLine(
                  showTimelineHeader: false,
                  dayProps: const EasyDayProps(
                    height: 71 * 1.2,
                    width: 43 * 1.2,
                    todayHighlightColor: ThemeColors.background,
                  ),
                  itemBuilder: (BuildContext context, String dayNumber, dayName,
                      monthName, fullDate, isSelected) {
                    return Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF4dbbef)
                            : ThemeColors.background,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 10, 0, 0),
                            child: Text(
                              dayName,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: isSelected
                                        ? ThemeColors.white
                                        : ThemeColors.tertiary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 12, 0, 5),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF1fa4e3)
                                    : ThemeColors.background,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                dayNumber,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: ThemeColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  firstDate: DateTime(
                      DateTime.now().year,
                      DateTime.now().month - 1,
                      DateTime.now()
                          .day), // Maybe start at account creation date..?
                  focusDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year,
                      DateTime.now().month + 1, DateTime.now().day), //End..?
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 16),
                child: Row(
                  children: [
                    Container(
                      width: 380,
                      height: 268,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111417),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: FlutterFlowCalendar(
                        color: ThemeColors.button,
                        iconColor: ThemeColors.tertiary,
                        weekFormat: false,
                        weekStartsMonday: false,
                        initialDate: DateTime.now(),
                        rowHeight: 32,
                        titleStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .override(
                                fontFamily: 'Lexend',
                                fontSize: 20,
                                color: ThemeColors.white),
                        dayOfWeekStyle: TextStyle(
                          fontFamily: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontFamily,
                          fontSize:
                              FlutterFlowTheme.of(context).labelLarge.fontSize,
                          color: ThemeColors.white,
                        ),
                        dateStyle: TextStyle(
                          fontFamily: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontFamily,
                          fontSize:
                              FlutterFlowTheme.of(context).bodyMedium.fontSize,
                          color: ThemeColors.white,
                        ),
                        inactiveDateStyle: TextStyle(
                          fontFamily: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontFamily,
                          fontSize:
                              FlutterFlowTheme.of(context).bodyMedium.fontSize,
                          color: ThemeColors.white,
                        ),
                        selectedDateStyle: TextStyle(
                          fontFamily: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontFamily,
                          fontSize:
                              FlutterFlowTheme.of(context).bodyMedium.fontSize,
                          color: ThemeColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  color: Color(0xFF111417),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Recently Completed",
                            style: TextStyle(
                              fontFamily: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontFamily,
                              fontSize: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontSize,
                              color: ThemeColors.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        transformAlignment: AlignmentDirectional.centerStart,
                        alignment: Alignment.topLeft,
                        width: 600,
                        height: 300,
                        child: ListView.builder(
                            itemCount: habitList.length,
                            itemBuilder: (context, index) {
                              return HabitBox(
                                name: habitList[index][0],
                                completed: habitList[index][1],
                                onChanged: (value) => tapCheckBox(value, index),
                                settingsTap: (context) => openHabitEdit(index),
                                deleteTap: (context) => deleteHabit(index),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ])),
        floatingActionButton: AddTrackerActionButton(
          onPressed: () => createHabit(),
        ),
        bottomNavigationBar: const AppNavBar());
  }
}
