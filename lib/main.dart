import 'package:task_manager_app/controllers/binding.dart';
import 'package:task_manager_app/database/db_helper.dart';
import 'package:task_manager_app/exports/exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: Homepage.id,
      title: 'Flutter Demo',
      getPages: [
        GetPage(name: Homepage.id, page: () => const Homepage()),
      ],
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: const Homepage(),
    );
  }
}
