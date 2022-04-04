import 'package:flutter/material.dart';

import '../../constant.dart';
import '../pages/detail_page.dart';
import 'navbar_item.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 200),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(35)),
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
            text: TextSpan(
              text: "Sengkaki",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Caramel',
                color: titleColor,
              ),
              children: const [
                TextSpan(
                  text: "Media",
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
          Row(
            children: [
              NavbarItem(
                icon: Icons.menu,
                title: 'Menu',
                color: Colors.green,
                onClick: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailPage()));
                },
              ),
              const SizedBox(width: 10),
              NavbarItem(
                icon: Icons.newspaper,
                title: 'Hot News',
                color: Colors.red,
                onClick: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailPage()));
                },
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
