import 'dart:convert';

import 'package:flutter_project/mapper/user_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';

class UserPreferences {
  static final userMapper = UserMapper();
  static late SharedPreferences _preferences;

  static const _keyUser = 'user4';
  static const defaultUser = User(
    imgPath: 'https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg?size=338&ext=jpg&ga=GA1.1.1395880969.1710028800&semt=ais',
    name: 'Ким Ролан Сергеевич',
    birthDate: '21.10.2000',
    email: 'example@gmail.com',
    telegramUsername: '@retgodx',
    jobPosition: 'Разработчик ПО. Java/React',
    about: 'Hello world!',
    isLightTheme: true,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(User user) async {
    final json = jsonEncode(userMapper.userToJson(user));

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);

    return json == null ? defaultUser : userMapper.jsonToUser(jsonDecode(json));
  }
}