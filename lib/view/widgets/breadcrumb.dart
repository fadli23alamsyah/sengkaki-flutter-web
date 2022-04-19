import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../responsive.dart';

class Breadcrumb extends StatelessWidget {
  final String title;

  const Breadcrumb({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double margin = (Responsive.isDesktop(context)) ? 200 : (Responsive.isTablet(context)) ? 100 : 0;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: (Responsive.isMobile(context))? double.infinity : 0,
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 78, bottom: 8, right: 15, left: 20),
        margin: EdgeInsets.only(bottom: 50, left: margin, right: margin),
        decoration: BoxDecoration(
          color: shadowColor,
          borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(35), bottomRight: Radius.circular((Responsive.isMobile(context))? 35 : 20)),
          boxShadow: const [
            BoxShadow(
              color: shadowNavColor,
              blurRadius: 5,
            ),
          ],
        ),
        child: Text(
          "Sengkaki / $title",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
