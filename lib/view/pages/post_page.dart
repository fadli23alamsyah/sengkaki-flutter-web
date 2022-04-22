import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPage extends StatefulWidget {
  const PostPage({ Key? key }) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        actions: [
          TextButton.icon(
            onPressed: (){}, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white70),
            ),
            icon: const Icon(Icons.add, color: Colors.white,), 
            label: const Text('Postingan', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: const {
                  0 : IntrinsicColumnWidth(),
                  2 : FixedColumnWidth(200),
                  3 : FixedColumnWidth(200),
                },
                children: [
                  // Header table
                  const TableRow(
                    children: [
                      TextHeader(title: 'No'),
                      TextHeader(title: 'Judul'),
                      TextHeader(title: 'Tanggal Post'),
                      TextHeader(title: 'Action'),
                    ]
                  ),
                  
                  // Field Data
                  TableRow(
                    children: [
                      TextHeader(title: '1'),
                      TextData(value: 'coba'),
                      TextData(value: 'coba'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonAction(
                            title: 'Edit', 
                            color: Colors.blueAccent, 
                            onClick: () => Get.dialog(
                              const FormDialogTable(),
                              barrierDismissible: false,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          ButtonAction(
                            title: 'Delete', 
                            color: Colors.redAccent, 
                            onClick: (){
                              Get.dialog(
                                AlertDialogTable(
                                  title: 'Delete Post', 
                                  content: 'Fabregas', 
                                  accept: (){
                                    Get.back();
                                    Get.snackbar('Success', 'Data berhasil dihapus');
                                  }
                                )
                              );
                            },
                          ),
                        ],
                      ),
                    ]
                  )
                ],
              ),
              Table(
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TextHeader(title: 'Tidak Ada Data'),
                    ]
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FormDialogTable extends StatefulWidget{
  final String? id;
  const FormDialogTable({Key? key, this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _FormDialogTableState();
}

class _FormDialogTableState extends State<FormDialogTable>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        (widget.id != null)? 'Update Post' : 'Tambah Post',
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
                  decoration: InputDecoration(
                    label: Text('Title', style: GoogleFonts.poppins()),
                  ),
                ),
                TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    label: Text('Description'),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: ()=> Get.back(), 
          child: Text(
            'Cancel', 
            style: GoogleFonts.poppins(),
          ),
        ),
        ElevatedButton(
          onPressed: (){}, 
          child: Text(
            (widget.id != null) ? 'Update' : 'Tambah', 
            style: GoogleFonts.poppins(
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}

class AlertDialogTable extends StatelessWidget{
  final String title;
  final String content;
  final Function accept;
  const AlertDialogTable({Key? key, required this.title, required this.content, required this.accept}) : super(key: key);

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
          onPressed: ()=> Get.back(), 
          child: Text(
            'No', 
            style: GoogleFonts.poppins(),
          ),
        ),
        ElevatedButton(
          onPressed: ()=> accept(), 
          child: Text(
            'Yes', 
            style: GoogleFonts.poppins(
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonAction extends StatelessWidget{
  final String title;
  final Color color;
  final Function onClick;

  const ButtonAction({Key? key, required this.title, required this.color, required this.onClick}) : super(key: key);

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

class TextData extends StatelessWidget{
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

class TextHeader extends StatelessWidget{
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