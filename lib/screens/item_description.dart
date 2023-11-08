import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/item.dart';


class ItemDescription extends StatelessWidget {
  final Item item;

  ItemDescription({required this.item});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Item Description'),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.width * 0.05)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'product_image_${item.namaItem}',
                      child: Image.asset('assets/images.jpg',
                          width: double.infinity, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.namaItem ?? '',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333333),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Price: Rp ${item.hargaItem?.toString() ?? ''}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color:Color(0xFF333333),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Kondisi Barang: ${item.jenisItem ?? ''}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF333333),
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Description: ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF333333),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item.deskripsiItem ?? '',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Color(0xFF333333),
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CupertinoButton.filled(
                onPressed: () {
                },
                child: Text('Bid Now'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
