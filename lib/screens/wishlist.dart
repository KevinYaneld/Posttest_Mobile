import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:posttest4_031_kevin/providers/wishlist_providers.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WishlistProvider>(
        builder: (context, wishlistProvider, child) {
          final wishlistItems = wishlistProvider.wishlist;

          return ListView.builder(
            itemCount: wishlistItems.length,
            itemBuilder: (context, index) {
              final item = wishlistItems[index];

              return Dismissible(
                key: Key(item.namaItem ?? ''), // Use a unique key
                onDismissed: (direction) {
                  wishlistProvider.deleteWishlist(item); // Use the provider function
                },
                background: Container(
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: ListTile(
                  title: Text(item.namaItem ?? ''),
                ),
              );
            },
          );
        },
      ),
    );
  }
}