enum UserLabel {
  profileTitle('Профиль пользователя'),
  name('Имя'),
  birthDate('День рождения'),
  bio('О себе'),
  email('Почта: '),
  telegram('Телеграм: '),
  contacts('Контакты');

  final String value;
  const UserLabel(this.value);
}