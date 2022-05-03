import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base_page.dart';
import '../../constant.dart';
import '../../responsive.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      background: [
        Positioned(
          top: 8,
          left: 100,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 100,
                    spreadRadius: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 200,
          right: 100,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.yellow,
                    blurRadius: 100,
                    spreadRadius: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.2,
          child: SvgPicture.asset(
            '$pathImageAssets/clouds.svg',
            alignment: Alignment.topCenter,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ],
      titleBreadcrumb: 'about',
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: navColor.withOpacity(.4),
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            about(),
            const Divider(thickness: 2, color: navColor,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  photo(),
                  const SizedBox(width: 10),
                  textAbout('ᨊᨘ ᨄᨒᨗ ᨕᨒᨐ ᨊᨔᨗ', 'Nur Fadli Alamsyah Nasir')
              ],
            ),
          ],
        ),
      )
    );
  }

  Widget photo(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        '$pathImageAssets/saya.png',
        fit: BoxFit.cover,
        height: 80,
      ),
    );
  }

  Widget about(){
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Tentang',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('''
      ᨔᨙᨀᨀᨗ ᨆᨙᨉᨗᨕ ᨕᨗᨕᨆᨈ ᨆᨙᨉᨗᨕ ᨕᨙᨑᨚ ᨅᨂᨘ ᨔᨘᨆᨂ ᨔᨗᨕᨁ ᨀᨄᨉᨘᨒᨗᨕ ᨊ ᨆᨉᨑᨀ ᨖᨘᨔᨘᨎ ᨈᨕᨘ ᨒᨚᨒᨚᨕ ᨄᨑᨙ ᨄᨉᨘᨒᨗ ᨑᨗ ᨅᨘᨉᨐ ᨔᨗᨕᨁ ᨒᨗᨀᨘᨂ ᨔᨙᨀᨗᨈ᨞ ᨀᨔᨘᨆ ᨕᨊᨙ ᨄᨑᨙ ᨕᨄᨒ ᨆᨔᨑᨀ ᨒᨒ ᨕᨄᨑᨙ ᨔᨚᨒᨘᨔᨗ ᨊᨔᨅ ᨕᨗᨔᨘ ᨕᨙᨑᨚ ᨅᨑᨗ-ᨅᨑᨗ ᨄᨚᨒᨙ ᨀᨉᨙᨈᨙᨊ ᨀᨗᨈ ᨕᨏᨒ ᨊᨁᨕᨘᨀᨂ᨞
      ᨀᨆᨈᨚᨍᨗ ᨕᨊ ᨅᨔ, ᨕᨂᨒᨙᨀᨗ ᨄᨙᨑ ᨄᨑᨙ ᨕᨎᨚᨑᨚ ᨄᨅᨍᨗᨀ ᨔᨗᨕᨁ ᨀᨆᨍᨘᨕ ᨅᨔ ᨈ᨞ ᨊᨔᨅ ᨈᨘᨁᨒ-ᨈᨘᨁᨒ ᨍᨆ ᨄᨈ ᨌᨑᨗᨈᨊ ᨈᨚᨍᨗ ᨊ ᨀᨈᨙ ᨕᨘᨀᨗᨑᨗ ᨌᨑᨚᨈ ᨄᨑᨙ ᨍᨆ ᨄᨚᨒᨙ᨞

ᨆᨙᨉᨗᨕ ᨄᨀᨙ ᨅᨔ ᨆᨀᨔᨑ
          ''',
          style: GoogleFonts.poppins(
            fontSize: 24,
          ),
          )
        ],
      ),
    );
  }

  Widget textAbout(String title, String subtitle, {CrossAxisAlignment crossAlignment = CrossAxisAlignment.start}){
    return Column(
      crossAxisAlignment: crossAlignment,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          subtitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black54
          ),
        ),
      ],
    );
  }
}