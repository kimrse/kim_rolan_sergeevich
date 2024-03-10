import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/enum/user_label_enum.dart';
import 'package:flutter_project/page/profile_page.dart';
import 'package:flutter_project/utils/themes.dart';
import 'package:flutter_project/utils/user_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  static final String title = UserLabel.profileTitle.value;

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeProvider(
      initTheme: user.isLightTheme ? MyThemes.lightTheme : MyThemes.darkTheme,
      // initTheme: MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: user.isLightTheme ? MyThemes.lightTheme : MyThemes.darkTheme,
          // theme: MyThemes.lightTheme,
          // theme: ThemeProvider.of(context),
          title: title,
          home: ProfilePage(),
        ),
      ),
    );
  }
}
