import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:web_makassar/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  // WidgetsBinding.instance;
  setPathUrlStrategy(); // to remove # in url
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Web Makassar',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const HomePage(),
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Makassar',
      initialRoute: '/',
      getPages: routesName,
    );
  }
}