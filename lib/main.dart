import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:web_makassar/routes.dart';

import 'view/pages/home_page.dart';

void main() {
  // WidgetsBinding.instance;
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

class TestLayout extends StatelessWidget {
  const TestLayout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(color: Colors.blue, height: 200,),
              Container(color: Colors.green, height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}