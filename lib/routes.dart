import 'package:get/get.dart';

import '../view/pages/category_page.dart';
import '../view/pages/detail_page.dart';
import '../view/pages/home_page.dart';

// route name
const String homePage = '/';
const String budayaPage = '/budaya';
const String lingkunganPage = '/lingkungan';
const String detailLingkunganPage = '/lingkungan/:name';

// list route
List<GetPage> routesName = [
  GetPage(name: homePage, page: () => const HomePage()),
  GetPage(name: budayaPage, page: () => const CategoryPage()),
  GetPage(name: lingkunganPage, page: () => const CategoryPage()),
  GetPage(name: detailLingkunganPage, page: () => const DetailPage()),
];