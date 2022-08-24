import 'package:task_manager_app/controllers/task_controller.dart';
import 'package:task_manager_app/exports/exports.dart';
import 'package:get/get.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() async{
     Get.lazyPut(() => TaskController,fenix: true);
  }
}
