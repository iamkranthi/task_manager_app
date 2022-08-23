import 'package:task_manager_app/exports/exports.dart';
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
      child: const SizedBox(
        height: 35,
        width: 35,
        child: Icon(
          Icons.nightlight_round,
          size: 31,
        ),
      ),
    );
  }
}
