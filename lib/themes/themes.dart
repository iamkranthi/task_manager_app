import 'package:flutter/material.dart';
import 'package:task_manager_app/themes/constant_colors.dart';

class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: Constantcolors.lightBackgroundColor,
    backgroundColor: Constantcolors.lightappbarColor,
    iconTheme: const IconThemeData(color: Constantcolors.lighticonColor),
  );
  static final dark = ThemeData(
    scaffoldBackgroundColor: Constantcolors.darkBackgroundColor,
    backgroundColor: Constantcolors.darkappbarColor,
    brightness: Brightness.dark,
    iconTheme: const IconThemeData(color: Constantcolors.darkiconColor),
  );
}
