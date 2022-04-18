import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({ Key? key }) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String category = Get.currentRoute.replaceAll(RegExp(r'/'), '');
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category +' ' + Uri.base.toString()),
    );
  }
}