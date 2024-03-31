part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

class UserSetState extends UserState {
  final User newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}

class UserChangeAge extends UserState {
  final int newAge;

  const UserChangeAge(this.newAge, User user)
      : super(existUser: true, user: user);
}

class UserAddProfession extends UserState {
  final String newProfession;

  const UserAddProfession(this.newProfession, User user)
      : super(existUser: true, user: user);
}

class UserDeleteState extends UserState {
  const UserDeleteState() : super(existUser: false, user: null);
}
