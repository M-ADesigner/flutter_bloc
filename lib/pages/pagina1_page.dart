import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/controllers/usuario_controller.dart';
import 'package:flutter_bloc_tutorial/models/usuario.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(usuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Obx(() {
        return (usuarioCtrl.existeUsuario.value)
            ? InformacionUsuario(usuario: usuarioCtrl.usuario.value)
            : NoInfo();
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          // onPressed: () => Get.to(Pagina2Page)),
          onPressed: () => Get.toNamed('/pagina2', arguments: {
                'nombre': 'Fernando',
                'edad': 40,
              })),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: const Center(
        child: Text('No hay Usuario selecionado'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({super.key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${this.usuario.nombre}')),
          ListTile(title: Text('Edad:  ${this.usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
