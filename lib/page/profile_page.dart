import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../enum/user_label_enum.dart';
import '../model/user.dart';
import '../page/edit_profile_page.dart';
import '../utils/user_preferences.dart';
import '../widget/appbar_widget.dart';
import '../widget/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  // const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: user.imgPath,
                onClicked: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditProfilePage()),
                  );
                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              buildMainInfo(user),
              buildContacts(user),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMainInfo(User user) => Column(
    children: [
      Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      Text(
        user.jobPosition,
        style: const TextStyle(color: Colors.grey),
      ),
      Text(
        user.birthDate,
        style: const TextStyle(color: Colors.grey),
      ), const SizedBox(height: 12),
    ],
  );

  Widget buildContacts(User user) => Column(
    children: [
      Text(
        UserLabel.contacts.value,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),   const SizedBox(height: 2),
      Text(
        UserLabel.email.value + user.email,
        style: const TextStyle(color: Colors.grey),
      ),   const SizedBox(height: 2),
      Text(
        UserLabel.telegram.value + user.telegramUsername,
        style: const TextStyle(color: Colors.grey),
      ),   const SizedBox(height: 2),
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 48),
    width: MediaQuery.of(context).size.width,
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          UserLabel.bio.value,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: const TextStyle(fontSize: 16, height: 1.4),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}