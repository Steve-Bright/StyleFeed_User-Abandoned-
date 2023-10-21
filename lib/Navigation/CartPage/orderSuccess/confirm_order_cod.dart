import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:clay_containers/clay_containers.dart';
import 'choose_payment_method.dart';
import 'order_success.dart';

class ConfirmOrderCOD extends StatefulWidget {
  const ConfirmOrderCOD({super.key});

  @override
  State<ConfirmOrderCOD> createState() => _ConfirmOrderCODState();
}

class _ConfirmOrderCODState extends State<ConfirmOrderCOD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChoosePaymentMethod()),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Confrim Your Order',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Text(
                'Delivery Address',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              ClayContainer(
                height: 110,
                width: double.infinity,
                color: Colors.grey[100],
                borderRadius: 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 3, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wai Yan Linn',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 65,
                            height: 35,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Change',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.deepPurple[200],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '09425362977',
                        style: GoogleFonts.montserrat(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Room 709 MGW Centre Botahtaung Tsp',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '133-137 41st Street Botahtaung Tsp, Yangon',
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Payment Method',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 15),
              ClayContainer(
                height: 110,
                width: double.infinity,
                color: Colors.grey[100],
                borderRadius: 10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 15, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 65,
                            height: 35,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Change',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.deepPurple[200],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ClayContainer(
                            height: 40,
                            width: 70,
                            color: Colors.white,
                            borderRadius: 8,
                            spread: 2,
                            child: Image.asset('assets/pay_images/cod.png'),
                          ),
                          SizedBox(width: 30),
                          Text(
                            'Cash On Delivery',
                            style: GoogleFonts.montserrat(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 150),

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
                    'Total Pyament',
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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderSuccessScreen()),
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
    );
  }
}
