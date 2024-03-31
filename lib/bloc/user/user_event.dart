part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;

  ActivateUser(this.user);
}

class ChangeAge extends UserEvent {
  final int newAge;

  ChangeAge(this.newAge);
}

class ChangeProfession extends UserEvent {
  final String newProfession;

  ChangeProfession(this.newProfession);
}

class DeleteUser extends UserEvent {
  DeleteUser();
}
