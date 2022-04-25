import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../model/news.dart';
import '../../responsive.dart';
import 'base_page.dart';
import '../../api/api_sengkaki.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late String id;
  News? detailNews;
  String? category;
  String? message;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    id = Get.parameters["unique_url"].toString();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getData();
  }

  void getData(){
    ApiSengkaki().getNewsById(id: id).then((value){
      _isLoading = false;
      message = value["message"];
      setState(() {
        (value["status"] == "Success") ? detailNews = value["data"] : detailNews = null ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titleBreadcrumb: detailNews == null ? '' : detailNews!.category,
      body: _isLoading ?
        const Center(child: CircularProgressIndicator())
        : (detailNews == null) ?
          Center(child: Text(message!),)
        : SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                detailNews!.title,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
                      child: Image.network(
                        detailNews!.imageUrl,
                        height: Responsive.isDesktop(context) ? 450 : 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        detailNews!.sourceImg,
                        style: GoogleFonts.poppins(color: Colors.grey.shade500),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detailNews!.description,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
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