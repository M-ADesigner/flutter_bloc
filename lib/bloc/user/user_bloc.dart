import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc_tutorial/models/user.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.user));
    });

    on<ChangeAge>((event, emit) {
      if (state.existUser) {
        //En este punto solo creamos un nuevo usuario con la edad cambiada y emitimos el nuevo estado
        final newUser = state.user!.copyWith(edad: event.newAge);
        emit(UserSetState(newUser));
      }
    });

    on<ChangeProfession>((event, emit) {
      if (state.existUser) {
        final newUser = state.user!.copyWith(
            profesiones: [...state.user!.profesiones, event.newProfession]);
        emit(UserSetState(newUser));
      }
    });

    on<DeleteUser>((event, emit) {
      emit(const UserDeleteState());
    });
  }
}
