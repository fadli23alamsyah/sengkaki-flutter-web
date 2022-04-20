import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/news.dart';
import '../../constant.dart';

class GridItem extends StatefulWidget {
  const GridItem({Key? key, required this.news, this.orientationLandscape = false}) : super(key: key);

  final bool orientationLandscape;
  final News news;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool scaleImage = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: (){
        print('tap');
      },
      onHover: (val){
        setState(() {
          scaleImage = val;
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: widget.orientationLandscape
            ? Row(
                children: [startItem(), const SizedBox(width: 15), endItem()],
              )
            : Column(
                children: [startItem(), const SizedBox(height: 8), endItem()],
              ),
      ),
    );
  }

  Widget startItem() {
    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            AnimatedScale(
              scale: scaleImage ? 1.1 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              child: Image.network(
                widget.news.imageUrl,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: const BoxDecoration(
                  color: navColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
                ),
                child: Text(
                  widget.news.category,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: widget.orientationLandscape ? 16 :14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget endItem() {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.orientationLandscape
              ? const SizedBox(height: 10)
              : const SizedBox(height: 0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.news.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 20,
                      // letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                widget.orientationLandscape
                    ? const SizedBox(height: 15)
                    : const SizedBox(height: 8),
                Flexible(
                  child: Text(
                    widget.news.subTitle,
                    maxLines: widget.orientationLandscape ? 8 : 2,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: subTitleColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          widget.orientationLandscape
              ? const SizedBox(height: 20)
              : const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: secondInfoBgColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  widget.news.datePost,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ),
              const Text(
                'Selengkapnya',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
