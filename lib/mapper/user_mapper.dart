import 'package:flutter_project/model/user.dart';

class UserMapper {
  Map<String, dynamic> userToJson(User user) => {
    'name': user.name,
    'birthDate': user.birthDate,
    'telegramUsername': user.telegramUsername,
    'jobPosition': user.jobPosition,
    'email': user.email,
    'about': user.about,
    'imgPath': user.imgPath,
    'isLightTheme': user.isLightTheme,
  };

  User jsonToUser(Map<String, dynamic> json) => User(
    name: json['name'],
    birthDate: json['birthDate'],
    email: json['email'],
    jobPosition: json['jobPosition'],
    telegramUsername: json['telegramUsername'],
    about: json['about'],
    imgPath: json['imgPath'],
    isLightTheme: json['isLightTheme'],
  );
}