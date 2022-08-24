import 'package:get/get.dart';
import 'package:task_manager_app/database/db_helper.dart';
import 'package:task_manager_app/models/task.dart';

class TaskController extends GetxController {
 

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }
}
