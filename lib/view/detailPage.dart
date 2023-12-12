import 'package:flutter/material.dart';
import 'package:laravelflutter/controllers/databaseHelper.dart';

import 'editpage.dart';

class DetailPage extends StatefulWidget {
  List list;
  int index;
  DetailPage({required this.list, required this.index, super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  //show dialog
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: Text('Are you sure ?'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                databaseHelper.deleteData(widget.list[widget.index]['id']);
              },
              child: Text('Delete'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.list[widget.index]['nameproduct'],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("Nama Product : ${widget.list[widget.index]['nameproduct']}"),
            Text(' Harga : ${widget.list[widget.index]['price']}'),
            SizedBox(
              height: 10.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditPage(
                        list: widget.list,
                        index: widget.index,
                      ),
                    ),
                  );
                },
                child: Text('Edit'),
              ),
              SizedBox(
                width: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  _showDialog();
                },
                child: Text('Delete'),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
