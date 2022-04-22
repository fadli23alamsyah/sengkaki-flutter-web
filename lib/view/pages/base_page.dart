import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../responsive.dart';
import '../../view/widgets/footer.dart';
import '../widgets/nav_bar.dart';
import '../../view/widgets/breadcrumb.dart';

class BasePage extends StatelessWidget{
  final List<Widget>? background;
  final Widget body;
  final String? titleBreadcrumb;

  const BasePage({Key? key, this.background, this.titleBreadcrumb,required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mainPadding = Responsive.isDesktop(context) ? 150 : Responsive.isTablet(context) ? 50 : 10 ;
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                // start desain background
                if(background != null) ...background!,
                // end desain background
                
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: mediaQuery.height,
                    minWidth: mediaQuery.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (titleBreadcrumb != null)? Breadcrumb(title: titleBreadcrumb!) : const SizedBox(height: 130),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: mainPadding),
                        child: body,
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