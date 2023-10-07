import 'package:flutter/material.dart';

class DetailCrad extends StatefulWidget {
  const DetailCrad({super.key});

  @override
  State<DetailCrad> createState() => _DetailCradState();
}

class _DetailCradState extends State<DetailCrad> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Detail Product",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        body: Center(
          child: Column(),
        ),
      ),
    );
  }
}
