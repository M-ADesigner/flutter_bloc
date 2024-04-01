import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/controllers/usuario_controller.dart';
import 'package:flutter_bloc_tutorial/models/usuario.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    //traer el controlador de la clase usuarioController para poder usarlo
    final usuarioCtrl = Get.find<usuarioController>();

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
                usuarioCtrl
                    .cargarUsuario(Usuario(nombre: 'Fernando', edad: 40));
                Get.snackbar(
                  'Atencion',
                  'Usuario establecido',
                );
              },
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              },
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white))),
          MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarProfesion(
                    'Profesion ${usuarioCtrl.profesionesCount + 1}');
              },
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white))),
          //Cambiar tema
          MaterialButton(
            onPressed: () {
              Get.changeTheme(
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
            child: const Text('Cambiar Tema'),
          )
        ],
      )),
    );
  }
}
