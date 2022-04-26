import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/text_utils.dart';
import '../../api/api_sengkaki.dart';
import '../../utils/time_utils.dart';
import '../../model/news.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool _isLoading = true;
  List<TableRow>? dataTable;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((_) async{
      await Get.dialog(
        AlertDialog(
          content: Container(
            padding: const EdgeInsets.all(10),
            child: const CircularProgressIndicator()
          ),
        ),
        barrierDismissible: false
      );
    });
    getData();
  }

  void updateClick(String id){
    Get.dialog(
      FormDialogTable(id: id),
      barrierDismissible: false,
    ).then((value) => getData());
  }

  void deleteClick(String id, String title){
    Get.dialog(AlertDialogTable(
      title: 'Delete Post',
      content: 'Hapus data $title',
      accept: () {
        ApiSengkaki().deleteNews(id: id).then((value){
          Get.back();
          Get.snackbar(value["status"], value["message"]);
        });
      },
    )).then((value) => getData());
  }

  void getData() {
    ApiSengkaki().getAllNews(select: 'all', limit: 0).then((value) {
      setState(() {
        if(value.isNotEmpty){
          int no = 1;
          dataTable = value.map((news){
            return TableRow(
                children: [
                  TextHeader(title: (no++).toString()),
                  TextData(value: news.title),
                  TextData(value: news.datePost!.timeFormatApp()),
                  ActionRow(
                    updateClick: () => updateClick(news.id!),
                    deleteClick: () => deleteClick(news.id!, news.title),
                  ),
                ]
              );
          }).toList();
        }
        _isLoading = false;
        Get.back();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: TextButton.icon(
              onPressed: () {
                Get.dialog(const FormDialogTable(), barrierDismissible: false).then((value){
                  getData();
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white70),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: const Text(
                'Postingan',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0: IntrinsicColumnWidth(),
                  2: FixedColumnWidth(200),
                  3: FixedColumnWidth(200),
                },
                children: [
                  // Header table
                  const TableRow(children: [
                    TextHeader(title: 'No'),
                    TextHeader(title: 'Judul'),
                    TextHeader(title: 'Tanggal Post'),
                    TextHeader(title: 'Action'),
                  ]),

                  // Field Data
                  if(!_isLoading && dataTable!.isNotEmpty) ...dataTable!,
                ],
              ),
              (!_isLoading && dataTable!.isEmpty)
                  ? Table(
                      border: TableBorder.all(),
                      children: const [
                        TableRow(children: [
                          TextHeader(title: 'Tidak Ada Data'),
                        ]),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class ActionRow extends StatelessWidget{
  const ActionRow({Key? key, required this.updateClick, required this.deleteClick}) : super(key: key);

  final Function updateClick;
  final Function deleteClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonAction(
          title: 'Edit',
          color: Colors.blueAccent,
          onClick: () => updateClick(),
        ),
        const SizedBox(width: 10),
        ButtonAction(
          title: 'Delete',
          color: Colors.redAccent,
          onClick: () => deleteClick()
        ),
      ],
    );
  }
}

class FormDialogTable extends StatefulWidget {
  final String? id;
  const FormDialogTable({Key? key, this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FormDialogTableState();
}

class _FormDialogTableState extends State<FormDialogTable> {
  final List<String> categoryName = ['budaya', 'lingkungan'];

  final _formKey = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();
  final imageUrl = TextEditingController();
  final sourceImg = TextEditingController();
  String? category;

  @override
  void initState() {
    super.initState();
    if(widget.id != null) {
      ApiSengkaki().getNewsById(id: widget.id!).then((value){
        title.text = value["data"].title;
        description.text = value["data"].description;
        imageUrl.text = value["data"].imageUrl;
        sourceImg.text = value["data"].sourceImg;
        category = value["data"].category;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    // _formKey.currentState!.dispose(); // error if dispose
    title.dispose();
    description.dispose();
    imageUrl.dispose();
    sourceImg.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        (widget.id != null) ? 'Update Post' : 'Add Post',
        style: GoogleFonts.poppins(),
      ),
      content: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width / 2,
        ),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: title,
                    decoration: const InputDecoration(
                      label: Text(
                        'Title',
                      ),
                    ),
                    validator: (val) {
                      return (val!.isEmpty)
                          ? 'Cannot be empty'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: description,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      label: Text('Description'),
                    ),
                    validator: (val) {
                      return (val!.isEmpty)
                          ? 'Cannot be empty'
                          : null;
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      label: Text('Category'),
                    ),
                    items: categoryName
                        .map((ca) => DropdownMenuItem(
                              child: Text(ca.ucWords()),
                              value: ca,
                            ))
                        .toList(),
                    value: category,
                    onChanged: (val) {
                      category = val.toString();
                    },
                    validator: (val) {
                      return (val == null) ? 'Cannot be empty' : null;
                    },
                  ),
                  TextFormField(
                    controller: imageUrl,
                    decoration: const InputDecoration(
                      label: Text('Url Image'),
                    ),
                    validator: (val) {
                      return (val!.isEmpty)
                          ? 'Cannot be empty'
                          : null;
                    },
                  ),
                  TextFormField(
                    controller: sourceImg,
                    decoration: const InputDecoration(
                      label: Text('Source Image'),
                    ),
                    validator: (val) {
                      return (val!.isEmpty)
                          ? 'Cannot be empty'
                          : null;
                    },
                  ),
                ],
              )),
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => Get.back(),
          child: Text(
            'Cancel',
            style: GoogleFonts.poppins(),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if(widget.id != null){
                ApiSengkaki().updateNews(
                  id: widget.id!, 
                  news: News(
                    title: title.text, 
                    description: description.text, 
                    category: category!, 
                    imageUrl: imageUrl.text, 
                    sourceImg: sourceImg.text
                  )).then((value){
                    Get.back();
                    Get.snackbar(value["status"], value["message"]);
                  });
              }else{
                ApiSengkaki().createNews(
                  news: News(
                    title: title.text, 
                    description: description.text, 
                    category: category!, 
                    imageUrl: imageUrl.text, 
                    sourceImg: sourceImg.text,
                  ),
                ).then((value){
                  Get.back();
                  Get.snackbar(value["status"], value["message"]);
                });
              }
            }
          },
          child: Text(
            (widget.id != null) ? 'Update' : 'Add',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class AlertDialogTable extends StatelessWidget {
  final String title;
  final String content;
  final Function accept;
  const AlertDialogTable(
      {Key? key,
      required this.title,
      required this.content,
      required this.accept})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
      content: Text('Apakah anda ingin menghapus $content ?'),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () => Get.back(),
          child: Text(
            'No',
            style: GoogleFonts.poppins(),
          ),
        ),
        ElevatedButton(
          onPressed: () => accept(),
          child: Text(
            'Yes',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class ButtonAction extends StatelessWidget {
  final String title;
  final Color color;
  final Function onClick;

  const ButtonAction(
      {Key? key,
      required this.title,
      required this.color,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: () => onClick(),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}

class TextData extends StatelessWidget {
  final String value;
  const TextData({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  final String title;
  const TextHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
