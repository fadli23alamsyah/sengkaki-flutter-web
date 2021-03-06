import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:url_strategy/url_strategy.dart';

import '../routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // setPathUrlStrategy(); // to remove # in url
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sengkaki Media',
      initialRoute: '/',
      getPages: routesName,
    );
  }
}