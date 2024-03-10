import 'dart:io';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/enum/action_label_enum.dart';
import 'package:flutter_project/enum/user_label_enum.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../model/user.dart';
import '../utils/user_preferences.dart';
import '../widget/appbar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import '../widget/textfield_widget.dart';
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  // const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => ThemeSwitchingArea(
    child: Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imgPath,
              isEdit: true,
              onClicked: () async {
                final image = await ImagePicker().getImage(source: ImageSource.gallery);
                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imgPath: newImage.path));
              },
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: UserLabel.name.value,
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: UserLabel.email.value,
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            TextFieldWidget(
              label: UserLabel.telegram.value,
              text: user.telegramUsername,
              onChanged: (telegramUsername) => user = user.copy(telegramUsername: telegramUsername),
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: UserLabel.bio.value,
              text: user.about,
              maxLines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: ActionLabel.save.value,
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ),
  );
}