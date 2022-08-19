import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  const HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "TASK MANAGER",
      textScaleFactor: 1.1,
      style: TextStyle(
        //color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
