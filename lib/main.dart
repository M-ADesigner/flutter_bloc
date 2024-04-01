import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bloc_tutorial/pages/pagina1_page.dart';
import 'package:flutter_bloc_tutorial/pages/pagina2_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/pagina1',
      getPages: [
        GetPage(name: '/pagina1', page: () => Pagina1Page()),
        GetPage(name: '/pagina2', page: () => const Pagina2Page()),
      ],
    );
  }
}
