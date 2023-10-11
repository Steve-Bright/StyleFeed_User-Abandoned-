import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 94, 94, 94)),
          maxLines: isExpanded ? 2 : 20,
          overflow: TextOverflow.ellipsis,
        ),
        GestureDetector(
          onTap: () {
            setState(
              () {
                isExpanded = !isExpanded;
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              isExpanded ? 'Read More' : 'Read Less',
              style: GoogleFonts.montserrat(
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
            style: GoogleFonts.montserrat(
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
            Column(
              children: [
                Image.asset(
                  "assets/1.png",
                  height: 300,
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Column(
              children: [
                Container(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Air Jondon 1 Retro High \nOff-White Chicago",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "\$5,300",
                                style: GoogleFonts.montserrat(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "* Only 2 Left *",
                              style: GoogleFonts.montserrat(color: Colors.red),
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.orange[500]),
                                    Icon(Icons.star, color: Colors.orange[500]),
                                    Icon(Icons.star, color: Colors.orange[500]),
                                    Icon(Icons.star, color: Colors.orange[500]),
                                    Icon(Icons.star, color: Colors.black),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sizes",
                        style: GoogleFonts.montserrat(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(0),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "6.5 UK",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(0),
                                border:
                                    Border.all(color: Colors.black, width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "7.5 UK",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Product Description",
                              style: GoogleFonts.montserrat(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: ReadMore(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_sharp),
              label: 'Add to Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Message',
            )
          ],
        ),
      ),
    );
  }
}
