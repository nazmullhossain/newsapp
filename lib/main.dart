import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newsapp/controller/publicController.dart';
import 'package:newsapp/pages/home_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Publiccontroller publicController = Get.put(Publiccontroller());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePages(),
      debugShowCheckedModeBanner: false,
    );
  }
}
