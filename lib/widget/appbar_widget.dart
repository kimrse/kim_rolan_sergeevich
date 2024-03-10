import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/themes.dart';
import '../utils/user_preferences.dart';

AppBar buildAppBar(BuildContext context) {
  final user = UserPreferences.getUser();
  final isLightTheme = user.isLightTheme;
  final icon = isLightTheme ? CupertinoIcons.moon_stars : CupertinoIcons.sun_max;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      ThemeSwitcher(
        builder: (context) => IconButton(
          icon: Icon(icon),
          onPressed: () {
            final theme = isLightTheme ? MyThemes.lightTheme : MyThemes.darkTheme;
            final switcher = ThemeSwitcher.of(context)!;
            switcher.changeTheme(theme: theme);
            final newUser = user.copy(isLightTheme: !isLightTheme);
            UserPreferences.setUser(newUser);
          },
        ),
      ),
    ],
  );
}