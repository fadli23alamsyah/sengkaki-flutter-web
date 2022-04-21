import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_makassar/view/widgets/navbar_item.dart';

import '../../responsive.dart';
import '../../constant.dart';
import '../../routes.dart';

class NavDialog extends StatelessWidget {
  const NavDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isMobile = (Responsive.isMobile(context));

    const Radius radiusNavDialog = Radius.circular(30);
    EdgeInsets _insetPadding = _isMobile
        ? const EdgeInsets.only(right: 40)
        : const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);
    double _minHeight = _isMobile ? double.infinity : 0;
    Alignment _alignment = _isMobile ? Alignment.centerLeft : Alignment.topCenter;

    return Dialog(
      insetPadding: _insetPadding,
      alignment: _alignment,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: _isMobile ? const Radius.circular(0) : radiusNavDialog,
            right: radiusNavDialog),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        constraints: BoxConstraints(
          minHeight: _minHeight,
          maxWidth: _isMobile ? 350 : 450,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: ()=> Get.back(),
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.blueGrey,
                child: Ink(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: _isMobile ? 10 : 20,
              mainAxisSpacing: _isMobile ? 10 : 20,
              childAspectRatio: 4 / ( _isMobile ? 3: 2),
              children: [
                NavDialogItem(
                  title: 'Budaya', 
                  icon: Icons.newspaper, 
                  color: Colors.green, 
                  onClick: () => Get.toNamed(budayaPage)
                ),
                NavDialogItem(
                  title: 'Lingkungan', 
                  icon: Icons.forest, 
                  color: Colors.blue, 
                  onClick: () => Get.toNamed(lingkunganPage)
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                print('object');
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Text('About'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class NavDialogItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function onClick;
  const NavDialogItem({ Key? key, required this.title, required this.icon, required this.color, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
        onClick();
      },
      splashColor: color.withAlpha(150),
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color.withOpacity(.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.4),
                        offset: const Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 2,
                      )
                    ]),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color:Colors.black,
                  letterSpacing: 0.5,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}