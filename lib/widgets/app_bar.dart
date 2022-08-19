import 'package:flutter/material.dart';
import 'package:task_manager_app/notifications/notifications.dart';
import 'package:task_manager_app/themes/theme_service.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 440,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlueAccent,
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
              onTap: () {
                ThemeService().switchTheme();

                NotifyHelper().displayNotification(
                    title: "Theme changed",
                    body: Get.isDarkMode
                        ? "Activated light mode"
                        : "Activated dark mode");
                NotifyHelper().scheduledNotification();
              },
              child: const Icon(Icons.ac_unit)), //!need to change with logo
          const SizedBox(width: 22),
          const Icon(Icons.person)
        ],
      ),
    );
  }
}
