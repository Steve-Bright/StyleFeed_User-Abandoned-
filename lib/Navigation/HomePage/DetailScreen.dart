import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  @override
  _ReadMoreState createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "The Off-White x Air Jordan 1 Retro High OG was one of the most highly anticipated footwear collaborations of 2017. It marked the first time Virgil Abloh, founder of the Milan-based fashion label and Jordan Brand had teamed up. Nicknamed \"The 10\" edition, this pair comes in the original Chicago-themed white, black and varsity red colorway. Featuring a white, red and black-based deconstructed leather upper with a Swooshless medial side branded with \"Off-White for Nike Air Jordan 1, Beaverton, Oregon, USA © 1985."
          // Show only 3 lines when not expanded
          ,
          style: TextStyle(color: const Color.fromARGB(255, 94, 94, 94)),
          maxLines: isExpanded ? 2 : 20,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isExpanded ? 'Read More' : 'Read Less',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          elevation: 0,
          title: Text(
            "Product",
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.favorite,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Image.asset(
              "assets/1.png",
              height: 300,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1,500,000 MMK",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border_sharp),
                                ),
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.send))
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "Jordan 1 Retro High",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Off-White Chicago",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Product Description",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: ReadMore(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
