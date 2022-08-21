import 'package:flutter/material.dart';
import 'package:task_manager_app/widgets/app_bar.dart';
import 'package:task_manager_app/widgets/header.dart';

import '../notifications/notifications.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ignore: prefer_typing_uninitialized_variables
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    NotifyHelper().initializeNotification();
    NotifyHelper().requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        SizedBox(height: 60),
        Header(),
        SizedBox(height: 18),
        CustomAppBar()
      ],
    ));
  }
}
