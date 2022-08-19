
import 'package:flutter/material.dart';
import 'package:task_manager_app/themes/constant_colors.dart';

class Themes{
  static final light =ThemeData(
    primaryColor: Constantcolors.appbarColor,
    brightness: Brightness.light,
  );
   static final dark =ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
  );

}