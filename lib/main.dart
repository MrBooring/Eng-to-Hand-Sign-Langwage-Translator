import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signs/binder/dashboard_bindings.dart';
import 'package:signs/view/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Dashboard(),
      initialBinding: TranslateBindings(),
    );
  }
}
