import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/news.dart';
import '../../responsive.dart';
import '../widgets/grid_item.dart';
import '../widgets/no_data.dart';
import 'base_page.dart';
import '../../utils/text_utils.dart';
import '../../constant.dart';
import '../../api/api_sengkaki.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String category = Get.currentRoute.replaceAll(RegExp(r'/'), '');
  String linkPage = Uri.base.toString();

  bool _isLoading = true;
  List<News>? categoryNews;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  void getData() {
    ApiSengkaki().getAllNews(select: category, limit: 0).then((value){
      setState(() {
        categoryNews = value;
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titleBreadcrumb: category,
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
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
        ),
      ],
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                category.ucWords(),
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? const CircularProgressIndicator()
                : (categoryNews!.isEmpty) 
                  ? const NoData()
                  : StaggeredGrid.count(
                    crossAxisCount: (Responsive.isDesktop(context))  ? 3 : (Responsive.isTablet(context)) ? 2 : 1,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: [
                      ...categoryNews!.map((item) {
                        return StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: GridItem(news: item),
                        );
                      })
                    ]),
          ],
        ),
      ),
    );
  }
}
