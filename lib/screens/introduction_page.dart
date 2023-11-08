import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:posttest4_031_kevin/screens/bottomNavbar.dart';

class IntroductionPage extends StatelessWidget {
  IntroductionPage();

  @override
  Widget build(BuildContext context) {
    final List<PageViewModel> pages = [
       PageViewModel(
        title: "Welcome to Auction Store",
        body: "Explore the world of auctions with Auction Store. Bid on your favorite items and win big!",
        image: Container(
          padding: EdgeInsets.only(top: 40.0), 
          child: Image.asset(
            "assets/auction.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
      PageViewModel(
        title: "Discover Amazing Deals",
        body: "Discover a wide range of products from electronics to collectibles. Find unique items and incredible deals.",
        image: Container(
          padding: EdgeInsets.only(top: 40.0), 
          child: Image.asset(
            "assets/Logo.png",
            fit: BoxFit.cover, 
          ),
        ),
      ),
      PageViewModel(
        title: "Get Started",
        body: "It's time to start bidding and winning. Join the Auction Store community and enjoy the thrill of auctions.",
        image: Container(
          padding: EdgeInsets.only(top: 40.0), 
          child: Image.asset(
            "assets/test.jpg",
            fit: BoxFit.cover, 
          ),
        ),
      ),
    ];

    return IntroductionScreen(
      pages: pages,
      showSkipButton: true,
      skip: Text("Skip"),
      next: Icon(Icons.arrow_forward),
      done: Text("Done"),
      onDone: () {
        // Navigate to the HomePage when the introduction is done.
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return BottomNavScreen();
            },
          ),
        );
      },
      nextFlex: 0,
    );
  }
}
