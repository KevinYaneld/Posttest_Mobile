import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top : (screenHeight * 0.2)),
              child: CircleAvatar(
                radius: screenWidth * 0.2, 
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), 
            Text(
              'Nama: Kevin Yaneld Cendhana',
              style: TextStyle(fontSize: screenWidth * 0.05), 
            ),
            SizedBox(height: screenHeight * 0.01), 
            Text(
              'NIM: 2109106031',
              style: TextStyle(fontSize: screenWidth * 0.05), 
            ),
            SizedBox(height: screenHeight * 0.01), 
            Text(
              "Kelas: A'21",
              style: TextStyle(fontSize: screenWidth * 0.05),
            ),
          ],
        ),
      ),
    );
  }
}