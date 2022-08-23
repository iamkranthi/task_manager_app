import 'package:task_manager_app/exports/exports.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          ThemeModeWidget(),
          CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/profile.jpg",
            ),
          )
        ],
      ),
    );
  }
}
