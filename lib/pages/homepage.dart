import 'package:task_manager_app/exports/exports.dart';

class Homepage extends StatefulWidget {
  static const id = '/details_page';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Header(),
          const SizedBox(height: 18),
          const CustomAppBar(),
         showTasks(),
        ],
      ),
    );
  }


}
