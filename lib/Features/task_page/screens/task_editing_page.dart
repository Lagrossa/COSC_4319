import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:addvisor/components/themeColors.dart';
import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:addvisor/Features/task_page/utils.dart';


class TaskEditingPage extends StatefulWidget{
  final Task? task;

  const TaskEditingPage({
    super.key,
    this.task,
  });
  @override
  _TaskEditingPageState createState() => _TaskEditingPageState();
}

class _TaskEditingPageState extends State<TaskEditingPage>{
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  late int prior;
  var priorOptions = ['1','2','3','4','5'];
  late bool allDay;
  late DatabaseReference dbRef;
  late User currUser;

  @override
  void initState() {
    super.initState();

    currUser = FirebaseAuth.instance.currentUser!;
    dbRef = FirebaseDatabase.instance.ref().child(currUser.uid).child('Tasks');
    if(widget.task == null){
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
      prior = 1;
      allDay = false;
    }
  }

  @override
  void dispose(){
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: ThemeColors.background,
    appBar: AppBar(
      backgroundColor: ThemeColors.background,
      leading:  const CloseButton(),
      actions: buildEditingActions(),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTitle(),
            const SizedBox(height: 12,),
            buildDateTimePickers(),
            buildPriorAllDay(),
          ],
        ),
      ),
    ),
  );

  List<Widget> buildEditingActions() => [
    ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeColors.background,
        shadowColor: ThemeColors.background,
      ),
      onPressed: saveForm,
      icon: const Icon(Icons.done),
      label: const Text('SAVE'),
    ),
  ];

  Widget buildTitle() => TextFormField(
    style: const TextStyle(fontSize: 24, color: Colors.white),
    decoration: const InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Add Task',
      hintStyle: TextStyle(color: Colors.grey),
    ),
    onFieldSubmitted: (_) => saveForm(),
    validator: (title) =>
    title != null && title.isEmpty ? 'Task name cannot be empty' : null,
    controller: titleController,
  );

  Widget buildDateTimePickers() => Column(
    children: [
      buildFrom(),
      buildTo(),
    ],
  );

  Widget buildFrom() => buildHeader(
    header: 'FROM',
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: buildDropdownField(
            text: Utils.toDate(fromDate),
            onClicked: () => pickFromDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(fromDate),
            onClicked: () => pickFromDateTime(pickDate: false),
          ),
        ),
      ],
    ),
  );

  Widget buildTo() => buildHeader(
    header: 'TO',
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: buildDropdownField(
            text: Utils.toDate(toDate),
            onClicked: () => pickToDateTime(pickDate: true),
          ),
        ),
        Expanded(
          child: buildDropdownField(
            text: Utils.toTime(toDate),
            onClicked: () => pickToDateTime(pickDate: false),
          ),
        ),
      ],
    ),
  );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
        fromDate,
        pickDate: pickDate
    );
    if(date == null) return;

    if(date.isAfter(toDate)) {
      toDate = DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if(date == null) return;

    setState(() => toDate = date);
  }

  Future<DateTime?> pickDateTime(
      DateTime initialDate, {
        required bool pickDate,
        DateTime? firstDate,
      }) async {
    if(pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2015, 8),
        lastDate: DateTime(2101),
      );

      if(date == null) return null;

      final time = Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    }//if
    else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if(timeOfDay == null) return null;

      final date = DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }//else
  }

  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text, style: const TextStyle(color: Colors.white),),
        trailing: const Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text(header, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          child,
        ],
      );

  Widget buildPriorAllDay() => Row(
    children: [
      Expanded(
        flex: 2,
        child: buildHeader(
          header: 'Priority',
          child: priorDropdown(),
        ),
      ),
      Expanded(
        child: buildHeader(
          header: 'IsAllDay',
          child: allDayCheck(),
        ),
      ),
    ],
  );

  Widget priorDropdown() =>
    DropdownButton<int>(
      value: prior,
      dropdownColor: ThemeColors.background,
      items: <int>[1,2,3,4,5].map((int menuPrior) {
        return DropdownMenuItem<int>(
          value: menuPrior,
          child: Text(menuPrior.toString(), style: const TextStyle(color: Colors.white),),
        );
      }).toList(),
      onChanged: (newPrior) {
        setState(() {
          prior = newPrior!;
        });
      },
    );

  Widget allDayCheck() =>
    Checkbox(
      value: allDay,
      checkColor: Colors.black,
      activeColor: Colors.grey,
      onChanged: (bool? boxValue) {
        setState(() {
          allDay = boxValue!;
        });
      },
      side: const BorderSide(
        color: Colors.white,
      ),
    );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      final addedTask = <String, dynamic> {
        'TaskName' : titleController.text,
        'StartTime' : fromDate.toString(),
        'EndTime' : toDate.toString(),
        'Priority' : prior,
        'AllDay?' : allDay
      };
      dbRef.push().set(addedTask)
          .then((_) => print('Task has been written'))
          .catchError(
              (error) => print('Got an error $error'));


      Navigator.pop(context);
    }
  }
}