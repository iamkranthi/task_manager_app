

import 'package:get/get.dart';
import 'package:task_manager_app/database/db_helper.dart';
import 'package:task_manager_app/models/task.dart';

class TaskController extends GetxController {
  @override
  void onReady()  {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
}
