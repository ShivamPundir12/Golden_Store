import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/cataloge_model.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson = await rootBundle.loadString("assets/json/product.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Stack(
                    children: [
                      Container(
                        height: 100,
                        color: Colors.grey.shade200,
                        child: Image.network(
                          item.image,
                          alignment: Alignment(0, -1),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Text(
                                  item.price.toString(),
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 7),
                        child: Text(
                          item.desc.toString(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      // Expanded(
                      //   flex: 20,
                      //   child: Container(
                      //     child: Padding(
                      //       padding: EdgeInsets.only(
                      //           top: MediaQuery.of(context).size.height / 7.5),
                      //       child:
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                  // Card(
                  //   clipBehavior: Clip.antiAlias,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: GridTile(
                  //     child: Image.network(
                  //       item.image,
                  //     ),
                  //   ),
                  // );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
