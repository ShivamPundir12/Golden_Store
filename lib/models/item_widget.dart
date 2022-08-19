import 'package:flutter/material.dart';

import 'cataloge_model.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: (CatalogModel.items.isNotEmpty)
          ? SizedBox(
              height: 900.0,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        child: GridTile(
                          child: Image.network(
                            item.image,
                            cacheWidth: 100,
                          ),
                          footer: Container(
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ));
                },
                itemCount: CatalogModel.items.length,
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
