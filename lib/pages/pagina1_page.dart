import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/bloc/user/user_bloc.dart';
import 'package:flutter_bloc_tutorial/models/user.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(DeleteUser());
              })
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          if (state.existUser) {
            return InformacionUsuario(user: state.user!);
          } else {
            return const Center(child: Text('No hay usuario seleccionado'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      // ignore: prefer_const_constructors
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
        ],
      ),
    );
  }
}
