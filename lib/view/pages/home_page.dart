import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../responsive.dart';
import '../widgets/no_data.dart';
import 'base_page.dart';
import '../../model/news.dart';
import '../../constant.dart';
import '../widgets/grid_item.dart';
import '../../api/api_sengkaki.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<News>? latestNews;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  void getData() {
    ApiSengkaki().getAllNews(select: 'all', limit: 11).then((value){
      setState(() {
        latestNews = value;
        _isLoading = false;
      });
    });
  }

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
            width: 3000,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ],
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Media Independen\nUntuk Anda',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: titleColor,
                  fontSize: 40,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          _isLoading
              ? const CircularProgressIndicator()
              : (latestNews!.isEmpty) 
                ? const NoData()
                : StaggeredGrid.count(
                  crossAxisCount: (Responsive.isDesktop(context))  ? 3 : (Responsive.isTablet(context)) ? 2 : 1,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  children: [
                      ...latestNews!.map((item) {
                        if (latestNews!.indexOf(item) == 0) {
                          return StaggeredGridTile.count(
                            crossAxisCellCount:
                                (Responsive.isDesktop(context)) ? 2 : 1,
                            mainAxisCellCount: 1,
                            child: GridItem(
                              orientationLandscape:
                                  (Responsive.isDesktop(context)) ? true : false,
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
        ],
      ),
    );
  }
}
