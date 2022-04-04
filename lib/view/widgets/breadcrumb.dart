import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 78, bottom: 8, right: 15, left: 20),
      margin: const EdgeInsets.only(bottom: 50, left: 200, right: 200),
      decoration: BoxDecoration(
        color: shadowColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35), bottomRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: shadowNavColor,
            blurRadius: 5,
          ),
        ],
      ),
      child: Text(
        "Sengkaki / Lingkungan",
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 11,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
