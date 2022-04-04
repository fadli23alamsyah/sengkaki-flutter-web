import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarItem extends StatefulWidget {
  const NavbarItem({Key? key, required this.icon, required this.title, required this.color, required this.onClick}) : super(key: key);

  final IconData icon;
  final String title;
  final Color color;
  final Function onClick;

  @override
  State<NavbarItem> createState() => _NavbarItemState();
}

class _NavbarItemState extends State<NavbarItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onClick(),
      onHover: (val){
        setState(() {
          _isHover = val;
        });
      },
      mouseCursor: SystemMouseCursors.click,
      child: Row(
        children: [
          AnimatedScale(
            scale: _isHover ? 0.85 : 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(0.4),
                      offset: const Offset(0, 2),
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ]),
              child: Icon(
                widget.icon,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 14,
                color: _isHover ? widget.color : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
