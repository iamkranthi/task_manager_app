import 'package:intl/intl.dart';
import 'package:task_manager_app/exports/exports.dart';

class AddTaskBar extends StatelessWidget {
  const AddTaskBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              )
            ],
          ),
          MyButton(
            label: "+Add Task",
            onTap: () {
              Get.to(
                () => const AddTaskPage(),
              );
            },
          )
        ],
      ),
    );
  }
}
