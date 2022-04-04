import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/news.dart';
import '../../constant.dart';
import '../../view/widgets/footer.dart';
import '../widgets/breadcrumb.dart';
import '../widgets/grid_item.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News>? news;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  Future getData() async {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        news = allNews;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                  top: 8,
                  left: 100,
                  child: Opacity(
                    opacity: 0.2,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(shape: BoxShape.circle,
                          // color: cardColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green,
                              blurRadius: 100,
                              spreadRadius: 100,
                            ),
                          ]),
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
                      decoration: const BoxDecoration(shape: BoxShape.circle,
                          // color: cardColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.yellow,
                              blurRadius: 100,
                              spreadRadius: 100,
                            ),
                          ]),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.2,
                  child: SvgPicture.asset(
                    '$pathImageAssets/clouds.svg',
                    alignment: Alignment.topCenter,
                    width: 1700,
                    fit: BoxFit.cover,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: mediaQuery.height,
                    minWidth: mediaQuery.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Breadcrumb(),
                      // const SizedBox(height: 130),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 150),
                        alignment: Alignment.center,
                        child: Text(
                          'Media Independen\nUntuk Anda ᨒᨚᨈᨑ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: titleColor,
                              fontSize: 40,
                              letterSpacing: 3,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 150),
                        child: _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : StaggeredGrid.count(
                                crossAxisCount: 3,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                children: [
                                    ...news!.map((item) {
                                      if (news!.indexOf(item) == 0) {
                                        return StaggeredGridTile.count(
                                          crossAxisCellCount: 2,
                                          mainAxisCellCount: 1,
                                          child: GridItem(
                                            orientationLandscape: true,
                                            news: item,
                                          ),
                                        );
                                      } else {
                                        return StaggeredGridTile.count(
                                          crossAxisCellCount: 1,
                                          mainAxisCellCount: 1,
                                          child: GridItem(news: item),
                                        );
                                      }
                                    })
                                  ]),
                      ),
                      const SizedBox(height: 60),
                      const Footer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const NavBar()
        ],
      ),
    );
  }
}
