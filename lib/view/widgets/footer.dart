import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          decoration: BoxDecoration(
            color: navColor,
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(35)),
          ),
          child: Column(
            children: [
              Image.asset('$pathImageAssets/support.png'),
              Divider(
                color: cardColor,
                thickness: 3,
              ),
              Text('Copyright @ Palpal - ${DateTime.now().year}')
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: BoxDecoration(
              color: titleColor,
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(50))),
          child: Text(
            'Support By',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
