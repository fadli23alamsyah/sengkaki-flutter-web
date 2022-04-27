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
        child: Responsive(
          mobile: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                photo(),
                const SizedBox(height: 10),
                aboutMe(),
             ],
           ), 
          tablet: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Expanded(
                  flex: 1,
                  child: photo(),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: aboutMe(),
                ),
             ],
           ),
           desktop: Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                Expanded(
                  flex: 1,
                  child: photo(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: aboutMe(),
                ),
             ],
           ),
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
        height: 350,
      ),
    );
  }

  Widget aboutMe(){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Tentang Nakke',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 20),
          textAbout('ᨕᨑᨙᨀᨘ Nur Fadli Alamsyah Nasir', 'Nama saya Nur Fadli Alamsyah Nasir'),
          const SizedBox(height: 10),
          textAbout('ᨕᨑᨙᨀᨘ Nur Fadli Alamsyah Nasir', 'Nama saya Nur Fadli Alamsyah Nasir'),
          const SizedBox(height: 10),
          textAbout('ᨕᨑᨙᨀᨘ Nur Fadli Alamsyah Nasir', 'Nama saya Nur Fadli Alamsyah Nasir'),
          const SizedBox(height: 10),
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