import 'package:flutter/material.dart';
import 'package:addvisor/components/themeColors.dart';
import 'package:addvisor/Features/task_page/model/task.dart';
import 'package:addvisor/Features/task_page/utils.dart';


class TaskEditingPage extends StatefulWidget{
  final Task? task;
  final addTask;

  const TaskEditingPage({
    Key? key,
    this.task,
    required this.addTask,
  }) : super(key: key);
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
  late Color backGround;

  @override
  void initState() {
    super.initState();

    if(widget.task == null){
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
      prior = 1;
    }
  }

  @override
  void dispose(){
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    //backgroundColor: ThemeColors.background,
    appBar: AppBar(
      backgroundColor: ThemeColors.background,
      leading:  CloseButton(),
      actions: buildEditingActions(),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTitle(),
            SizedBox(height: 12,),
            buildDateTimePickers(),
            buildPrior(),
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
      icon: Icon(Icons.done),
      label: Text('SAVE'),
    ),
  ];

  Widget buildTitle() => TextFormField(
    style: TextStyle(fontSize: 24),
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      hintText: 'Add Task',
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
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text(header, style: TextStyle(fontWeight: FontWeight.bold),),
          child,
        ],
      );

  Widget buildPrior() => buildHeader(
    header: 'Priority',
    child: priorDropdown(),
  );

  Widget priorDropdown() =>
    DropdownButton<int>(
      value: prior,
      items: <int>[1,2,3,4,5].map((int menuPrior) {
        return DropdownMenuItem<int>(
          value: menuPrior,
          child: Text(menuPrior.toString()),
        );
      }).toList(),
      onChanged: (newPrior) {
        setState(() {
          prior = newPrior!;
        });
      },
    );

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      switch(prior){
        case 1:
          backGround = Colors.blue;
          break;
        case 2:
          backGround = Colors.green;
          break;
        case 3:
          backGround = Colors.amber[400]!;
          break;
        case 4:
          backGround = Colors.orange;
          break;
        case 5:
          backGround = Colors.red;
          break;
      }
      final task = Task(
        taskName: titleController.text,
        from: fromDate,
        to: toDate,
        priority: prior,
        backgroundColor: backGround,
      );

      //would add here
      widget.addTask(task);

      //IT WORKS!!!!!!!!!
      Navigator.pop(context);
    }
  }
}