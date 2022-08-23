// ignore_for_file: avoid_print
import 'package:intl/intl.dart';
import 'package:task_manager_app/controllers/task_controller.dart';
import 'package:task_manager_app/exports/exports.dart';
import 'package:task_manager_app/models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _noteController = TextEditingController();
  // ignore: prefer_final_fields
  DateTime _selectedDate = DateTime.now();
  String _endTime = "10:30 PM";
  String _startTime = DateFormat("hh:mm:a").format(DateTime.now()).toString();
  int _selectedRemind = 5;

  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];
  String _slectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  int _slectedColor = 0;

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
                  TextFielInputs(
                    title: "Title",
                    hint: "Enter your title",
                    controller: _titleController,
                  ),
                  TextFielInputs(
                    title: "Note",
                    hint: "Enter your note",
                    controller: _noteController,
                  ),
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
                            icon: const Icon(Icons.access_time_sharp),
                          ),
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
                            icon: const Icon(Icons.access_time_sharp),
                          ),
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
                  TextFielInputs(
                    title: "Repeat",
                    hint: _slectedRepeat,
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
                      items: repeatList.map<DropdownMenuItem<String>>(
                        (String? value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value!,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _slectedRepeat = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _colorPallete(),
                      MyButton(
                          label: "Create Task",
                          onTap: () {
                            _validateDate();
                          }),
                    ],
                  )
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

  getTimeFromUser({required bool isStartTime, bool mounted = true}) async {
    var pickedTime = await _showTimePicker();
    if (!mounted) return;
    String formatedTime = pickedTime.format(context);
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

//*color pallete
  _colorPallete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color", style: titleStyle),
        const SizedBox(height: 8),
        Wrap(
          children: List<Widget>.generate(
            3,
            (int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _slectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: index == 0
                        ? Constantcolors.pinkColor
                        : index == 1
                            ? Constantcolors.orangeColor
                            : Constantcolors.yellowColor,
                    child: _slectedColor == index
                        ? const Icon(
                            Icons.done,
                            color: Colors.black,
                          )
                        : Container(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

//*validation
  _validateDate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      _addTasktoDb();
      Get.toNamed(Homepage.id);
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Requried",
        "All fields are requried",
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: const Duration(milliseconds: 800),
        backgroundColor: Colors.white,
        icon: const Icon(
          Icons.warning_rounded,
          color: Colors.redAccent,
        ),
      );
    }
  }

  _addTasktoDb() async {
    int value = await _taskController.addTask(
      task: Task(
        note: _noteController.text,
        title: _titleController.text,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        repeat: _slectedRepeat,
        remind: _selectedRemind,
        color: _slectedColor,
        isCompleted: 0,
      ),
    );
    print("My id is " + "$value");
  }
}
