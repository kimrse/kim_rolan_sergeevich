class User {
  final String name;
  final String birthDate;
  final String jobPosition;
  final String email;
  final String telegramUsername;
  final String about;
  final String imgPath;
  final bool isLightTheme;

  const User({
    required this.name,
    required this.birthDate,
    required this.jobPosition,
    required this.email,
    required this.telegramUsername,
    required this.about,
    required this.imgPath,
    required this.isLightTheme,
  });

  User copy({
    String? name,
    String? birthDate,
    String? jobPosition,
    String? telegramUsername,
    String? email,
    String? about,
    String? imgPath,
    bool? isLightTheme,
  }) =>
      User(
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        jobPosition: jobPosition ?? this.jobPosition,
        telegramUsername: telegramUsername ?? this.telegramUsername,
        email: email ?? this.email,
        about: about ?? this.about,
        imgPath: imgPath ?? this.imgPath,
        isLightTheme: isLightTheme ?? this.isLightTheme,
      );
}