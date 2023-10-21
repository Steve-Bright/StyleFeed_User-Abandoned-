import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:clay_containers/clay_containers.dart';



class OrderSuccessScreen extends StatefulWidget {


  @override
  _OrderSuccessScreenState createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/order_success/checked.png',
                      height: 170,
                    ),
                    Text(
                      'Order Received!',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),

                    Text(
                      'Order #1234335',
                      style: GoogleFonts.montserrat(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 20),

                    Container(
                      child: ClayContainer(
                        width: 310,
                        height: 210,
                        color: Colors.grey[50],
                        borderRadius: 10,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20,15,20,10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClayText(
                                "Buyer's Details:",
                                emboss: true,
                                depth: 100,
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,6,10,6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClayText(
                                      'Tyson Jacob',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    ClayText(
                                      '0934523242',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    SizedBox(height: 3),

                                    ClayText(
                                      'No.5(A), Kyun Taw Road, San Chaung Tsp, Yangon',
                                      emboss: true,
                                      depth: 110,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 10,
                                        letterSpacing: 1,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,

                              ),
                              SizedBox(height: 6),

                              ClayText(
                                "Order Details:",
                                emboss: true,
                                depth: 100,
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,6,10,6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClayText(
                                          'Ordered Date',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          'Paid By',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          'Paid On',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClayText(
                                          '10 OCT 2023 12:43',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          'Cash On Delivery',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          '~',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height:20),
                    Container(
                      child: ClayContainer(
                        width: 340,
                        height: 280,
                        borderRadius: 10,
                        color: Colors.grey[50],
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 5, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClayText(
                              "Product Details:",
                              emboss: true,
                              depth: 100,
                              style: GoogleFonts.montserrat(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(
                                        'assets/order_success/order1.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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

                                  SizedBox(width: 30),

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

                              SizedBox(height: 30),

                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image.asset(
                                      'assets/order_success/order2.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(15,0,0,0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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

                                            SizedBox(width: 55),
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

                                  SizedBox(width: 30),

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
                              SizedBox(height: 20),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                              SizedBox(height: 6),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,20,6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClayText(
                                          'Subtotal',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          'Delivery Fee',
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          'Total',
                                          emboss: true,
                                          depth: 100,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        ClayText(
                                          '    MMK  42500',
                                          color: Colors.lightGreen[100],
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          '    MMK    2500',
                                          color: Colors.lightGreen[100],
                                          emboss: true,
                                          depth: 110,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 10,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(height: 3),

                                        ClayText(
                                          'MMK 45000',
                                          color: Colors.lightGreen[100],
                                          emboss: true,
                                          depth: 100,
                                          style: GoogleFonts.montserrat(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Your order will be delivered soon.',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Thank You! for choosing our app',
                      style: GoogleFonts.montserrat(
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePage()), //route to user homepage
              // );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[200],
              minimumSize: Size(250, 45),
              side: BorderSide.none,
              shape: StadiumBorder(),
            ),
            child: Text(
              'OK',
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
