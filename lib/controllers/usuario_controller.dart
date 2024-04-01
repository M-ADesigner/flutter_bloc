import 'package:get/get.dart';

import 'package:flutter_bloc_tutorial/models/usuario.dart';

class usuarioController extends GetxController {
  // Observables que se pueden escuchar desde cualquier parte de la aplicación con obs
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  get profesionesCount => usuario.value.profesiones.length;

  void cargarUsuario(Usuario usuario) {
    this.usuario.value = usuario;
    existeUsuario.value = true;
  }

  void cambiarEdad(int NewEdad) {
    this.usuario.update((val) {
      val!.edad = NewEdad;
    });
  }

  void cambiarProfesion(String profesion) {
    usuario.update((val) {
      val!.profesiones = [...val.profesiones, profesion];
    });
  }
}
