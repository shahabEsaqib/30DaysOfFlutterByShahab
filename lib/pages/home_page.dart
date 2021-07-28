import 'dart:convert';

import 'package:demo_project/models/catalog.dart';
import 'package:demo_project/widgets/drawer.dart';
import 'package:demo_project/widgets/item_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
   
  }

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(20, (index) => CatalogeModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Text('Catalog App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummylist[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
