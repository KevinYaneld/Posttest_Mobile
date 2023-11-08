import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/wishlist.dart';

class WishlistProvider extends ChangeNotifier {
  List<Wishlist> _wishlist = [];

  List<Wishlist> get wishlist => _wishlist;

  void addWishlist(Wishlist wishlist) {
    _wishlist.add(wishlist);
    notifyListeners();
  }

    void deleteWishlist(Wishlist wishlist) {
    _wishlist.remove(wishlist);
    notifyListeners();
  }
}