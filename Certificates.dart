import 'package:flutter/material.dart';

class Certificates extends StatelessWidget {
  const Certificates({Key? key});

  @override
  Widget build(BuildContext context) {
    var myItems = [
      "image/certificate1.jpg",
      "image/certificate2.jpg",
      "image/About.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Certificates"),
        backgroundColor:
            Color.fromARGB(255, 18, 172, 219), // Set the app bar color
      ),
      body: Container(
        color:
            Color.fromARGB(255, 14, 5, 5), // Set the background color to black
        child: ListView.builder(
          itemCount: myItems.length,
          itemBuilder: (context, index) {
            return CertificateImage(imagePath: myItems[index]);
          },
        ),
      ),
    );
  }
}

class CertificateImage extends StatelessWidget {
  final String imagePath;

  const CertificateImage({Key? key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4, // Add elevation for a card-like appearance
        child: Column(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover, // Set the image fit mode
            ),
          ],
        ),
      ),
    );
  }
}
