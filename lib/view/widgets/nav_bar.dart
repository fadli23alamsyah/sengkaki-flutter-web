import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_makassar/routes.dart';

import '../../constant.dart';
import '../pages/detail_page.dart';
import 'navbar_item.dart';
import '../../responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Responsive.isDesktop(context) ? 200 : (Responsive.isTablet(context))? 100 : 0),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      height: 70,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: navColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
        boxShadow: [
          BoxShadow(
            color: shadowNavColor,
            blurRadius: 8,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              text: "Sengkaki",
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Caramel',
                color: titleColor,
              ),
              children: [
                TextSpan(
                  text: "Media",
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
              ],
            ),
          ),
          (Responsive.isDesktop(context))
              ? Row(
                  children: [
                    NavbarItem(
                      icon: Icons.newspaper,
                      title: 'Budaya',
                      color: Colors.green,
                      onClick: () {
                        Get.toNamed(budayaPage);
                      },
                    ),
                    const SizedBox(width: 10),
                    NavbarItem(
                      icon: Icons.forest,
                      title: 'Lingkungan',
                      color: Colors.blue,
                      onClick: () {
                        Get.toNamed(lingkunganPage);
                      },
                    ),
                  ],
                )
              : NavbarItem(
                  icon: Icons.menu,
                  color: titleColor,
                  onClick: () {
                    
                  },
                ),
        ],
      ),
    );
  }
}
