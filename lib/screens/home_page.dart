import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/providers/item_list_providers.dart';
import 'package:posttest4_031_kevin/widgets/categoryLabel.dart';
import 'package:posttest4_031_kevin/widgets/product.dart';
import 'package:provider/provider.dart';
import 'addItem.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemListProvider>(context);
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/lelang.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kategori',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CategoryLabel(label: 'All'),
                        CategoryLabel(label: 'Shoes'),
                        CategoryLabel(label: 'Smartphones'),
                        CategoryLabel(label: 'Watch'),
                        CategoryLabel(label: 'Car'),
                        CategoryLabel(label: 'Home Appliances'),
                        CategoryLabel(label: 'Art'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Produk',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
             const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (MediaQuery.of(context).size.width / 150).floor(),
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: itemProvider.itemList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = itemProvider.itemList[index];
                  return ProductItem(
                    name: item.namaItem ?? '',
                    price: item.hargaItem?.toString() ?? '',
                    imagePath: 'assets/images.jpg',
                    description: item.deskripsiItem ?? '',
                    item: item,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemForm(
                onSubmit: (item) {
                  itemProvider.addItem(item);
                },
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}


