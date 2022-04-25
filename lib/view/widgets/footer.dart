import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant.dart';
import '../../responsive.dart';
import '../../routes.dart';
import '../widgets/navbar_item.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
      decoration: const BoxDecoration(
        color: navColor,
        borderRadius:
            BorderRadius.only(topRight: Radius.circular(35)),
      ),
      child: Column(
        children: [
          Responsive(
            // footer mobile
            // responsive
            mobile: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: LogoMedia(),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: FooterSection(
                        title: 'Menu', 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FooterMenuItem(title: 'Budaya', onClick: () => Get.toNamed(budayaPage)),
                            FooterMenuItem(title: 'Lingkungan', onClick: () => Get.toNamed(lingkunganPage)),
                            FooterMenuItem(title: 'About', onClick: () => Get.toNamed(lingkunganPage)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                FooterSection(
                  title: 'Support By', 
                  child: Image.asset('$pathImageAssets/support.png'),
                ),
                const SizedBox(height: 10),
                FooterSection(
                  title: 'Social Media', 
                  child: Row(
                    children: [
                      NavbarItem(
                        icon: FontAwesomeIcons.instagram, 
                        color: const Color(0xFFE1306C), 
                        onClick: ()=>print('object'),
                      ),
                      const SizedBox(width: 10,),
                      NavbarItem(
                        icon: FontAwesomeIcons.linkedin, 
                        color: const Color(0xFF0E76A8), 
                        onClick: ()=>print('object'),
                      ),
                    ],
                  )
                ),
              ],
            ),

            // footer tablet
            // responsive
            tablet: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LogoMedia(),
                      const SizedBox(height: 10),
                      FooterSection(
                        title: 'Menu', 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FooterMenuItem(title: 'Budaya', onClick: () => Get.toNamed(budayaPage)),
                            FooterMenuItem(title: 'Lingkungan', onClick: () => Get.toNamed(lingkunganPage)),
                            FooterMenuItem(title: 'About', onClick: () => Get.toNamed(lingkunganPage)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      FooterSection(
                        title: 'Support By', 
                        child: Image.asset('$pathImageAssets/support.png'),
                      ),
                      const SizedBox(height: 10),
                      FooterSection(
                        title: 'Social Media', 
                        child: Row(
                          children: [
                            NavbarItem(
                              icon: FontAwesomeIcons.instagram, 
                              color: const Color(0xFFE1306C), 
                              onClick: ()=>print('object'),
                            ),
                            const SizedBox(width: 10,),
                            NavbarItem(
                              icon: FontAwesomeIcons.linkedin, 
                              color: const Color(0xFF0E76A8), 
                              onClick: ()=>print('object'),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // footer desktop
            // responsive
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(
                  flex: 1,
                  child: Center(child: LogoMedia()),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      FooterSection(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        title: 'Menu', 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FooterMenuItem(title: 'Budaya', onClick: () => Get.toNamed(budayaPage)),
                            FooterMenuItem(title: 'Lingkungan', onClick: () => Get.toNamed(lingkunganPage)),
                            FooterMenuItem(title: 'About', onClick: () => Get.toNamed(lingkunganPage)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      FooterSection(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        title: 'Support By', 
                        child: Image.asset('$pathImageAssets/support.png'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: FooterSection(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    title: 'Social Media', 
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NavbarItem(
                          icon: FontAwesomeIcons.instagram, 
                          color: const Color(0xFFE1306C), 
                          onClick: ()=> html.window.open('https://www.instagram.com/pal23pal','instagram'),
                        ),
                        const SizedBox(width: 10,),
                        NavbarItem(
                          icon: FontAwesomeIcons.linkedin, 
                          color: const Color(0xFF0E76A8), 
                          onClick: ()=> html.window.open('https://www.linkedin.com/in/fadlialamsyah/','linkedin'),
                        ),
                        const SizedBox(width: 10,),
                        NavbarItem(
                          icon: FontAwesomeIcons.facebook, 
                          color: const Color(0xFF4267B2), 
                          onClick: ()=> html.window.open('https://www.facebook.com/fadli.noer.9/','facebook'),
                        ),
                      ],
                    )
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: cardColor,
            thickness: 3,
          ),
          Text('Copyright \u00a9 Palpal - ${DateTime.now().year}', style: GoogleFonts.poppins(),)
        ],
      ),
    );
  }
}

class FooterMenuItem extends StatelessWidget{
  final String title;
  final Function onClick;
  const FooterMenuItem({Key? key, required this.title, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, bottom: 10),
      child: InkWell(
        onTap: () => onClick(),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: bgColor,
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget{
  final String title;
  final Widget child;
  final CrossAxisAlignment? crossAxisAlignment;
  const FooterSection({Key? key, required this.title, required this.child, this.crossAxisAlignment = CrossAxisAlignment.start}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment!,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        child,
      ],
    );
  }
}

class LogoMedia extends StatelessWidget{
  const LogoMedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: "Sengkaki",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Caramel',
              color: titleColor,
            ),
            children: [
              TextSpan(
                text: "Media",
                style: TextStyle(fontSize: 23, color: Colors.black54),
              ),
            ],
          ),
        ),
        Text(
          'Media independen untuk anda',
          style: GoogleFonts.poppins(
            color: Colors.black54,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}