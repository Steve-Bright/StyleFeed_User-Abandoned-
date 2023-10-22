import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:clay_containers/clay_containers.dart';
import 'choose_address.dart';

class CheckoutDetail extends StatefulWidget {
  const CheckoutDetail({super.key});

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => CheckOut()), //Link with checkout
              // );
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Check Out Details',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ClayContainer(
                    height: 35,
                    width: 180,
                    borderRadius: 3,
                    child: Center(
                      child: Text(
                        'Product Details',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ClayContainer(
                  width: double.infinity,
                  height: 130,
                  borderRadius: 10,
                  color: Colors.grey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle tap action here
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: ClayText(
                                    'Sold by Hi Beauty',
                                    emboss: true,
                                    depth: 120,
                                    color: Colors.grey[400],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 11,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8), // Add spacing between the text and icon
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 10,
                        endIndent: 30,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              'assets/order_success/order1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClayText(
                                  'Backless Crop-Top',
                                  emboss: true,
                                  depth: 120,
                                  color: Colors.grey[400],
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(height: 8),
                                ClayText(
                                  'Color : Brown',
                                  emboss: true,
                                  depth: 110,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 9,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(height: 10, width: 10),
                                Row(
                                  children: [
                                    ClayText(
                                      'Size : Free',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 9,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(width: 40),
                                    ClayText(
                                      'Qty : 1',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 9,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClayContainer(
                            color: Colors.green[50],
                            emboss: false,
                            borderRadius: 5,
                            width: 80,
                            height: 30,
                            spread: 0.5,
                            child: Center(
                              child: ClayText(
                                'MMK 13500',
                                emboss: true,
                                color: Colors.lightGreen[100],
                                depth: 110,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ClayContainer(
                  width: double.infinity,
                  height: 130,
                  borderRadius: 10,
                  color: Colors.grey[50],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              // Handle tap action here
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: ClayText(
                                    'Sold by Hi Beauty',
                                    emboss: true,
                                    depth: 120,
                                    color: Colors.grey[400],
                                    style: GoogleFonts.montserrat(
                                      fontSize: 11,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8), // Add spacing between the text and icon
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 10,
                        endIndent: 30,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              'assets/order_success/order2.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClayText(
                                  'Tweet Coat',
                                  emboss: true,
                                  depth: 120,
                                  color: Colors.grey[400],
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(height: 8),
                                ClayText(
                                  'Color : Red',
                                  emboss: true,
                                  depth: 110,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 9,
                                    letterSpacing: 1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ClayText(
                                      'Size : M',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 9,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(height: 30, width: 20),
                                    ClayText(
                                      'Qty : 1',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 9,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ClayContainer(
                            color: Colors.green[50],
                            emboss: false,
                            borderRadius: 5,
                            width: 80,
                            height: 30,
                            spread: 0.5,
                            child: Center(
                              child: ClayText(
                                'MMK 29000',
                                emboss: true,
                                color: Colors.lightGreen[100],
                                depth: 110,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),
                Center(
                  child: CouponBox(),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub-Total',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\MMK  30000',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\MMK  2500',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 30,
                        color: Colors.black,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Payment',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '\MMK  32500',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressBook()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[200],
              minimumSize: Size(250, 45),
              side: BorderSide.none,
              shape: StadiumBorder(),
            ),
            child: Text(
              'Confrim',
              style: GoogleFonts.montserrat(
                color: Colors.grey[800],
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CouponBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 180,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey[200],
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 0, 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Coupon Code',
                hintStyle: GoogleFonts.montserrat(
                  color: Colors.grey[350],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none, // Hide the outline
              ),
            ),
          ),
        ),
        SizedBox(width: 10), // Add spacing between the container and button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple[200],
            minimumSize: Size(25, 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Text(
            'Enter',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}