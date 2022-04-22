import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../model/news.dart';
import '../../responsive.dart';
import 'base_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late News detailNews;
  final String content = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vel quam elementum pulvinar etiam non. Accumsan tortor posuere ac ut consequat semper viverra nam. Dui ut ornare lectus sit amet est placerat in. Vulputate sapien nec sagittis aliquam malesuada bibendum. Aliquam id diam maecenas ultricies mi eget mauris pharetra. Nibh mauris cursus mattis molestie a. Amet volutpat consequat mauris nunc. Vitae ultricies leo integer malesuada nunc vel. Adipiscing diam donec adipiscing tristique. Cursus in hac habitasse platea dictumst quisque.

Sed sed risus pretium quam vulputate dignissim suspendisse. Sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum. Scelerisque eu ultrices vitae auctor. Ullamcorper dignissim cras tincidunt lobortis feugiat. Tempor nec feugiat nisl pretium fusce. Pellentesque elit eget gravida cum sociis natoque penatibus. Sit amet nisl suscipit adipiscing bibendum est ultricies. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Habitant morbi tristique senectus et netus et. Id cursus metus aliquam eleifend mi in nulla posuere sollicitudin.

Ut enim blandit volutpat maecenas volutpat blandit aliquam etiam. Tellus orci ac auctor augue mauris augue neque gravida. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Accumsan sit amet nulla facilisi. Condimentum vitae sapien pellentesque habitant morbi tristique senectus. Integer malesuada nunc vel risus commodo viverra maecenas. Quis hendrerit dolor magna eget. Eget est lorem ipsum dolor. Ultricies tristique nulla aliquet enim tortor at auctor. Nec feugiat in fermentum posuere urna nec tincidunt praesent.

Ac ut consequat semper viverra nam libero justo laoreet sit. Id aliquet risus feugiat in ante. Auctor urna nunc id cursus metus. At tempor commodo ullamcorper a. Nam libero justo laoreet sit amet cursus sit amet. Ac tincidunt vitae semper quis. Sed elementum tempus egestas sed sed risus. Diam sollicitudin tempor id eu nisl. Urna molestie at elementum eu facilisis sed. Faucibus a pellentesque sit amet. Sit amet massa vitae tortor condimentum lacinia quis. Id aliquet risus feugiat in ante metus dictum. At tempor commodo ullamcorper a lacus vestibulum. Aliquet eget sit amet tellus cras adipiscing enim eu. Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Elementum tempus egestas sed sed risus pretium quam.

Aliquam ut porttitor leo a diam. In cursus turpis massa tincidunt dui ut ornare lectus. Elementum tempus egestas sed sed risus pretium quam. Velit euismod in pellentesque massa placerat duis ultricies lacus. Integer vitae justo eget magna fermentum iaculis eu. Dui vivamus arcu felis bibendum. Sit amet mattis vulputate enim nulla. Hac habitasse platea dictumst quisque sagittis. Amet dictum sit amet justo donec. Fringilla ut morbi tincidunt augue interdum velit. Porta lorem mollis aliquam ut porttitor leo a.

Ultrices vitae auctor eu augue ut lectus. Vivamus at augue eget arcu dictum varius. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Sagittis vitae et leo duis. Sollicitudin tempor id eu nisl. Maecenas ultricies mi eget mauris pharetra et ultrices. Etiam sit amet nisl purus in. Aliquet bibendum enim facilisis gravida neque convallis a cras. Sem viverra aliquet eget sit amet tellus cras adipiscing enim. Vitae et leo duis ut diam quam. Curabitur gravida arcu ac tortor dignissim. Faucibus scelerisque eleifend donec pretium vulputate sapien. Sed viverra tellus in hac. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. A condimentum vitae sapien pellentesque habitant morbi tristique senectus. Tempor id eu nisl nunc mi ipsum. Nisl tincidunt eget nullam non nisi est.

Purus non enim praesent elementum facilisis leo. Purus in massa tempor nec. Vel quam elementum pulvinar etiam non quam lacus. Gravida in fermentum et sollicitudin ac orci. Bibendum at varius vel pharetra vel turpis nunc. Blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque. Libero id faucibus nisl tincidunt eget nullam non. Sed id semper risus in. Faucibus scelerisque eleifend donec pretium. Metus aliquam eleifend mi in. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dignissim convallis aenean et tortor at risus. Tortor at auctor urna nunc id. Orci ac auctor augue mauris augue neque gravida in. Ac tortor vitae purus faucibus ornare suspendisse sed nisi lacus.

Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Quisque non tellus orci ac auctor. Dolor magna eget est lorem. Vel turpis nunc eget lorem dolor sed viverra. Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. Massa sed elementum tempus egestas. Lobortis elementum nibh tellus molestie nunc non blandit massa. Amet venenatis urna cursus eget nunc scelerisque viverra mauris. Ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla. Elit pellentesque habitant morbi tristique senectus et netus et malesuada.

Lobortis feugiat vivamus at augue eget arcu. Adipiscing tristique risus nec feugiat in fermentum. Sollicitudin nibh sit amet commodo nulla. Et odio pellentesque diam volutpat commodo. Erat nam at lectus urna. Nec nam aliquam sem et tortor consequat. Eu scelerisque felis imperdiet proin fermentum leo. Proin sed libero enim sed faucibus turpis in eu mi. Non nisi est sit amet facilisis magna etiam tempor orci. Quam elementum pulvinar etiam non. Faucibus a pellentesque sit amet porttitor eget dolor. Vel pretium lectus quam id leo in vitae turpis. Leo in vitae turpis massa sed elementum tempus. Velit euismod in pellentesque massa placerat duis. In eu mi bibendum neque egestas congue quisque egestas. Lorem mollis aliquam ut porttitor leo. A erat nam at lectus urna duis convallis. Vitae proin sagittis nisl rhoncus mattis.

Vitae auctor eu augue ut lectus arcu. Massa sapien faucibus et molestie ac feugiat sed. Dolor morbi non arcu risus. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Enim lobortis scelerisque fermentum dui faucibus in ornare quam. Placerat duis ultricies lacus sed turpis tincidunt id aliquet risus. Ipsum consequat nisl vel pretium lectus quam id. Libero nunc consequat interdum varius sit amet mattis vulputate enim. Faucibus scelerisque eleifend donec pretium. Amet facilisis magna etiam tempor orci eu lobortis elementum. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Id leo in vitae turpis massa. Ornare massa eget egestas purus viverra accumsan. Nunc mi ipsum faucibus vitae aliquet. Non diam phasellus vestibulum lorem sed risus ultricies tristique nulla. Consequat semper viverra nam libero justo. Leo duis ut diam quam. Ut sem nulla pharetra diam sit amet nisl suscipit adipiscing. Volutpat blandit aliquam etiam erat velit scelerisque in dictum non. Varius morbi enim nunc faucibus.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vel quam elementum pulvinar etiam non. Accumsan tortor posuere ac ut consequat semper viverra nam. Dui ut ornare lectus sit amet est placerat in. Vulputate sapien nec sagittis aliquam malesuada bibendum. Aliquam id diam maecenas ultricies mi eget mauris pharetra. Nibh mauris cursus mattis molestie a. Amet volutpat consequat mauris nunc. Vitae ultricies leo integer malesuada nunc vel. Adipiscing diam donec adipiscing tristique. Cursus in hac habitasse platea dictumst quisque.

Sed sed risus pretium quam vulputate dignissim suspendisse. Sapien et ligula ullamcorper malesuada proin libero nunc consequat interdum. Scelerisque eu ultrices vitae auctor. Ullamcorper dignissim cras tincidunt lobortis feugiat. Tempor nec feugiat nisl pretium fusce. Pellentesque elit eget gravida cum sociis natoque penatibus. Sit amet nisl suscipit adipiscing bibendum est ultricies. Et sollicitudin ac orci phasellus egestas tellus rutrum tellus pellentesque. Habitant morbi tristique senectus et netus et. Id cursus metus aliquam eleifend mi in nulla posuere sollicitudin.

Ut enim blandit volutpat maecenas volutpat blandit aliquam etiam. Tellus orci ac auctor augue mauris augue neque gravida. Pellentesque habitant morbi tristique senectus et netus et malesuada fames. Accumsan sit amet nulla facilisi. Condimentum vitae sapien pellentesque habitant morbi tristique senectus. Integer malesuada nunc vel risus commodo viverra maecenas. Quis hendrerit dolor magna eget. Eget est lorem ipsum dolor. Ultricies tristique nulla aliquet enim tortor at auctor. Nec feugiat in fermentum posuere urna nec tincidunt praesent.

Ac ut consequat semper viverra nam libero justo laoreet sit. Id aliquet risus feugiat in ante. Auctor urna nunc id cursus metus. At tempor commodo ullamcorper a. Nam libero justo laoreet sit amet cursus sit amet. Ac tincidunt vitae semper quis. Sed elementum tempus egestas sed sed risus. Diam sollicitudin tempor id eu nisl. Urna molestie at elementum eu facilisis sed. Faucibus a pellentesque sit amet. Sit amet massa vitae tortor condimentum lacinia quis. Id aliquet risus feugiat in ante metus dictum. At tempor commodo ullamcorper a lacus vestibulum. Aliquet eget sit amet tellus cras adipiscing enim eu. Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Elementum tempus egestas sed sed risus pretium quam.

Aliquam ut porttitor leo a diam. In cursus turpis massa tincidunt dui ut ornare lectus. Elementum tempus egestas sed sed risus pretium quam. Velit euismod in pellentesque massa placerat duis ultricies lacus. Integer vitae justo eget magna fermentum iaculis eu. Dui vivamus arcu felis bibendum. Sit amet mattis vulputate enim nulla. Hac habitasse platea dictumst quisque sagittis. Amet dictum sit amet justo donec. Fringilla ut morbi tincidunt augue interdum velit. Porta lorem mollis aliquam ut porttitor leo a.

Ultrices vitae auctor eu augue ut lectus. Vivamus at augue eget arcu dictum varius. Arcu cursus vitae congue mauris rhoncus aenean vel elit. Sagittis vitae et leo duis. Sollicitudin tempor id eu nisl. Maecenas ultricies mi eget mauris pharetra et ultrices. Etiam sit amet nisl purus in. Aliquet bibendum enim facilisis gravida neque convallis a cras. Sem viverra aliquet eget sit amet tellus cras adipiscing enim. Vitae et leo duis ut diam quam. Curabitur gravida arcu ac tortor dignissim. Faucibus scelerisque eleifend donec pretium vulputate sapien. Sed viverra tellus in hac. Tellus pellentesque eu tincidunt tortor aliquam nulla facilisi. A condimentum vitae sapien pellentesque habitant morbi tristique senectus. Tempor id eu nisl nunc mi ipsum. Nisl tincidunt eget nullam non nisi est.

Purus non enim praesent elementum facilisis leo. Purus in massa tempor nec. Vel quam elementum pulvinar etiam non quam lacus. Gravida in fermentum et sollicitudin ac orci. Bibendum at varius vel pharetra vel turpis nunc. Blandit volutpat maecenas volutpat blandit aliquam etiam erat velit scelerisque. Libero id faucibus nisl tincidunt eget nullam non. Sed id semper risus in. Faucibus scelerisque eleifend donec pretium. Metus aliquam eleifend mi in. Faucibus ornare suspendisse sed nisi lacus sed viverra tellus. Dignissim convallis aenean et tortor at risus. Tortor at auctor urna nunc id. Orci ac auctor augue mauris augue neque gravida in. Ac tortor vitae purus faucibus ornare suspendisse sed nisi lacus.

Imperdiet massa tincidunt nunc pulvinar sapien et ligula ullamcorper. Quisque non tellus orci ac auctor. Dolor magna eget est lorem. Vel turpis nunc eget lorem dolor sed viverra. Arcu cursus vitae congue mauris rhoncus aenean vel elit scelerisque. Massa sed elementum tempus egestas. Lobortis elementum nibh tellus molestie nunc non blandit massa. Amet venenatis urna cursus eget nunc scelerisque viverra mauris. Ipsum suspendisse ultrices gravida dictum fusce ut placerat orci nulla. Elit pellentesque habitant morbi tristique senectus et netus et malesuada.

Lobortis feugiat vivamus at augue eget arcu. Adipiscing tristique risus nec feugiat in fermentum. Sollicitudin nibh sit amet commodo nulla. Et odio pellentesque diam volutpat commodo. Erat nam at lectus urna. Nec nam aliquam sem et tortor consequat. Eu scelerisque felis imperdiet proin fermentum leo. Proin sed libero enim sed faucibus turpis in eu mi. Non nisi est sit amet facilisis magna etiam tempor orci. Quam elementum pulvinar etiam non. Faucibus a pellentesque sit amet porttitor eget dolor. Vel pretium lectus quam id leo in vitae turpis. Leo in vitae turpis massa sed elementum tempus. Velit euismod in pellentesque massa placerat duis. In eu mi bibendum neque egestas congue quisque egestas. Lorem mollis aliquam ut porttitor leo. A erat nam at lectus urna duis convallis. Vitae proin sagittis nisl rhoncus mattis.

Vitae auctor eu augue ut lectus arcu. Massa sapien faucibus et molestie ac feugiat sed. Dolor morbi non arcu risus. Vestibulum rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Enim lobortis scelerisque fermentum dui faucibus in ornare quam. Placerat duis ultricies lacus sed turpis tincidunt id aliquet risus. Ipsum consequat nisl vel pretium lectus quam id. Libero nunc consequat interdum varius sit amet mattis vulputate enim. Faucibus scelerisque eleifend donec pretium. Amet facilisis magna etiam tempor orci eu lobortis elementum. Phasellus faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Id leo in vitae turpis massa. Ornare massa eget egestas purus viverra accumsan. Nunc mi ipsum faucibus vitae aliquet. Non diam phasellus vestibulum lorem sed risus ultricies tristique nulla. Consequat semper viverra nam libero justo. Leo duis ut diam quam. Ut sem nulla pharetra diam sit amet nisl suscipit adipiscing. Volutpat blandit aliquam etiam erat velit scelerisque in dictum non. Varius morbi enim nunc faucibus.''';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titleBreadcrumb: 'Get.currentRoute',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              maxLines: 2,
              overflow: TextOverflow.clip,
              style: GoogleFonts.poppins(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: secondInfoBgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Text(
                'Desember 23, 2000',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
                    child: Image.network(
                      allNews[0].imageUrl,
                      height: Responsive.isDesktop(context) ? 450 : 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    'sumber image',
                    style: GoogleFonts.poppins(color: Colors.grey.shade500),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(content),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}