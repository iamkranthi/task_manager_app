import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager_app/notifications/notifications.dart';
import 'package:task_manager_app/themes/theme_service.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  //bool toggleShow = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          SizedBox(width: 34),
          Text(
            "TASK MANAGER",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(width: 60),
          ThemeModeWidget(),
        ],
      ),
    );
  }
}

class ThemeModeWidget extends StatelessWidget {
  const ThemeModeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ThemeService().switchTheme();

        NotifyHelper().displayNotification(
            title: "Theme changed",
            body: Get.isDarkMode
                ? "Activated light mode"
                : "Activated dark mode");
        NotifyHelper().scheduledNotification();
      },
      child: SizedBox(
        height: 35,
        width: 35,
        child: Image.asset('assets/images/night-mode.png'))
    );
  }
}
