import 'package:flutter/material.dart';
import 'package:task_manager_app/themes/constant_colors.dart';

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
        color: Constantcolors.lightBackgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const[
          Icon(Icons.ac_unit,color: Colors.black), 
          SizedBox(width: 22),
          Icon(Icons.person,color: Colors.black54,)
        ],
      ),
    );
  }
}
