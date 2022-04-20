import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_page.dart';
import '../../constant.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String category = Get.currentRoute.replaceAll(RegExp(r'/'), '');
  String linkPage = Uri.base.toString();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      background: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
          ),
        ),
      ],
      titleBreadcrumb: category,
      body: const Text('Okey'),
    );
  }
}
