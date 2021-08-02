import 'dart:convert';
//import 'package:demo_project/widgets/drawer.dart';
import 'package:demo_project/utilities/routes.dart';
import 'package:demo_project/widgets/home_widgets/catalog_header.dart';
import 'package:demo_project/widgets/home_widgets/catalog_list.dart';
import 'package:demo_project/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo_project/models/catalog.dart';
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
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogeModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creemcolor,
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkBluishColor,
          child: Icon(CupertinoIcons.cart)),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatlogHeader(),
              // ignore: unnecessary_null_comparison
              if (CatalogeModel.items != null && CatalogeModel.items.isNotEmpty)
                CatalogList().py12().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      // body:Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: (CatalogeModel.items.isNotEmpty)
      //       ? GridView.builder(
      //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2,
      //             crossAxisSpacing: 16,
      //             mainAxisSpacing: 16,
      //           ),
      //           itemBuilder: (context, index) {
      //             final item = CatalogeModel.items[index];
      //             return Card(
      //                 clipBehavior: Clip.antiAlias,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(10)),
      //                 child: GridTile(
      //                   header: Container(
      //                     child: Text(
      //                       item.name,
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.deepPurple),
      //                   ),
      //                   child: Image.network(item.image),
      //                   footer: Container(
      //                     child: Text(
      //                       item.price.toString(),
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                     padding: const EdgeInsets.all(12),
      //                     decoration: BoxDecoration(color: Colors.deepPurple),
      //                   ),
      //                 ));
      //           },
      //           itemCount: CatalogeModel.items.length,
      //         )
      //       // ListView.builder(
      //       //     itemCount: CatalogeModel.items.length,
      //       //     itemBuilder: (context, index) =>
      //       //         ItemWidget(item: CatalogeModel.items[index]),
      //       //   )
      //       : Center(
      //           child: CircularProgressIndicator(),
      //         ),
      // ),
      // drawer: MyDrawer(),
    );
  }
}
