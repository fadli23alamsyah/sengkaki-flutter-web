import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_makassar/view/widgets/breadcrumb.dart';
import 'package:web_makassar/view/widgets/footer.dart';

import '../../view/widgets/nav_bar.dart';
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
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: mediaQuery.width,
                    minHeight: mediaQuery.height,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Breadcrumb(title: category),
                      // FittedBox(
                      //   child: Column(
                      //     children: [
                      //       Text(category),
                      //     ],
                      //   ),
                      // ),
                      const Footer()
                    ],
                  ),
                ),
              ],
            ),
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
