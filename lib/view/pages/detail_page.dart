import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/news.dart';
import 'base_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late News detailNews;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titleBreadcrumb: 'Get.currentRoute',
      body: Text(Get.parameters['unique_url']!),
    );
  }
}