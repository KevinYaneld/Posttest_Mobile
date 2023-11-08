import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/item.dart';
import 'package:posttest4_031_kevin/models/wishlist.dart';
import 'package:posttest4_031_kevin/screens/item_description.dart';
import 'package:posttest4_031_kevin/providers/wishlist_providers.dart';
import 'package:provider/provider.dart'; // Import your WishlistProvider

class ProductItem extends StatelessWidget {
  final String name;
  final String price;
  final String imagePath;
  final String description;
  final Item item;

  ProductItem(
      {required this.name,
      required this.price,
      required this.imagePath,
      required this.description,
      required this.item});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDescription(item: item),
          ),
        );
      },
      child: SizedBox(
        height: 300,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'product_image_${item.namaItem}',
                child: Image.asset(imagePath,
                    width: double.infinity, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Text('Starting Bid : \nRp. $price'),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 3.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Bid Now',
                          style: TextStyle(
                            color: Colors.white, // Set the text color to white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 3.0, left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Wishlist wishlist = Wishlist(
                            namaItem: item.namaItem,
                            hargaItem: item.hargaItem,
                            jenisItem: item.jenisItem,
                            deskripsiItem: item.deskripsiItem,
                          );
                          wishlistProvider.addWishlist(wishlist);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add to Wishlist',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
