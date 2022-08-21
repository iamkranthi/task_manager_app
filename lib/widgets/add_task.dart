
import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/header.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: const [
            SizedBox(height: 60),
            Header(),
          ],
        ),
      ),
    );
  }
}
