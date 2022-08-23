// ignore_for_file: avoid_print

import 'package:intl/intl.dart';
import 'package:task_manager_app/exports/exports.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  // ignore: prefer_final_fields
  DateTime _selectedDate = DateTime.now();
  String _endTime = "10:30 PM";
  String _startTime = DateFormat('hh:mm:a').format(DateTime.now()).toString();
  int _selectedRemind = 5;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Header(),
            Container(
              padding: const EdgeInsets.only(left: 27, right: 25, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Task",
                    style: headingStyle,
                  ),
                  const TextFielInputs(
                      title: "Titdatale", hint: "Enter your title"),
                  const TextFielInputs(title: "Note", hint: "Enter your note"),
                  TextFielInputs(
                    title: "Date",
                    hint: DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                      onPressed: () {
                        getDateFromUser(context);
                      },
                      icon: const Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFielInputs(
                          title: "Start Time",
                          hint: _startTime,
                          widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: true);
                              },
                              icon: const Icon(Icons.access_time_sharp)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFielInputs(
                          title: "End Time",
                          hint: _endTime,
                          widget: IconButton(
                              onPressed: () {
                                getTimeFromUser(isStartTime: false);
                              },
                              icon: const Icon(Icons.access_time_sharp)),
                        ),
                      ),
                    ],
                  ),
                  TextFielInputs(
                    title: "Remind",
                    hint: "$_selectedRemind minutes early",
                    widget: DropdownButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      iconSize: 32,
                      elevation: 4,
                      style: subtitleStyle,
                      dropdownColor: Colors.blueGrey,
                      underline: Container(
                        height: 0,
                      ),
                      items: remindList.map<DropdownMenuItem<String>>(
                        (int value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//*datepicking method
  getDateFromUser(context) async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2124),
    );
    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    } else {
      print("Something is wrong");
    }
  }

//*Time picking method

  getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String formatedTime = pickedTime.format();
    if (pickedTime == null) {
      print("Time canceled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}
