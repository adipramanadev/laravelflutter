import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laravelflutter/controllers/databaseHelper.dart';
import 'dasboard.dart';

class EditPage extends StatefulWidget {
  List list;
  int index;
  EditPage({
    required this.list,
    required this.index,
    super.key,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  //deklarasi form
  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();

  @override
  void initState() {
    setState(() {
      _txtName = TextEditingController(
        text: widget.list[widget.index]['nameproduct'],
      );
      _txtPrice = TextEditingController(
          text: widget.list[widget.index]['price'].toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: TextField(
              controller: _txtName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: "Product Name",
                labelText: "Product Name",
              ),
            ),
          ),
          TextField(
            controller: _txtPrice,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: "Product Price",
              labelText: "Product Price",
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              //validasi form
              if (_txtName.text.isEmpty || _txtPrice.text.isEmpty) {
                //scaffold Messanger,
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //     content: Text('Data Tidak Boleh Kosong'),
                //   ),
                // );
                Fluttertoast.showToast(
                    msg: "Data Tidak Boleh Kosong",
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: const Color.fromARGB(255, 132, 55, 55));
              } else {
                //update data
                databaseHelper.editData(
                    _txtName.text.trim(),
                    _txtPrice.text.trim().toString(),
                    widget.list[widget.index]['id'].toString());
                //redirect ke halaman dasboard
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Dashboard(),
                ));
              }
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
