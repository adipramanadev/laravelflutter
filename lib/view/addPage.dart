import 'package:flutter/material.dart';
import 'package:laravelflutter/controllers/databaseHelper.dart';

import 'dasboard.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  //include class dbHelper
  DatabaseHelper dbHelper = DatabaseHelper();
  //deklarasi form
  final TextEditingController _txtName = TextEditingController();
  final TextEditingController _txtPrice = TextEditingController();

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
              dbHelper.addData(_txtName.text.trim(), _txtPrice.text.trim());
              //redirect ke halaman dasboard
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Dashboard(),
              ));
            },
            child: Text('Save', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
