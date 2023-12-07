import 'package:flutter/material.dart';
import 'package:laravelflutter/controllers/databaseHelper.dart';

import 'addPage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DatabaseHelper dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddPage(),
                ),
              );
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: dbHelper.getApi(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ItemList(list: snapshot.data)
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({required this.list, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              child: ListTile(
                title: Text(list[index]['nameproduct']),
                subtitle: Text(list[index]['price'].toString()),
                leading: const Icon(Icons.widgets),
              ),
            ),
          );
        },
        itemCount: list.length);
  }
}
