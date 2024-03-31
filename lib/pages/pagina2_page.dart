import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_tutorial/models/user.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = User(
                    nombre: 'Fernando',
                    edad: 36,
                    profesiones: ['FullStack Developer']);

                // BlocProvider.of<UserBloc>(context, listen: false ).add( ActivateUser(newUser) );
                userBloc.add(ActivateUser(newUser));
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeAge(30));
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userBloc.add(ChangeProfession('Carpintero'));
              },
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white))),
        ],
      )),
    );
  }
}
