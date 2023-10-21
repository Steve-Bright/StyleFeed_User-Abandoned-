import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'choose_payment_method.dart';
import 'confirm_order_credit.dart';
import 'order_success.dart';
import 'choose_payment_method.dart';
import 'card_home_page.dart';




class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _type = 1;
  void _handleRadio(Object? e) => setState(() {
    _type = e as int;
  });

  void intState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,overlays:[]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
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
            'Select Payment',
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
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 1;
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 1
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 1,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'KBZ Pay',
                                    style: _type == 1
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/pay_images/kpay.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 2;
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 2
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 2,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'Wave Pay',
                                    style: _type == 2
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/pay_images/wavepay.png',
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 3;
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 3
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 3,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'AYA Pay',
                                    style: _type == 3
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/pay_images/aya.jpg',
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 4;
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 4
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 4,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'CB Pay',
                                    style: _type == 4
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/pay_images/cbpay.png',
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 5;
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 5
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 5,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'MAB Mobile Banking',
                                    style: _type == 5
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/pay_images/mab.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 6;
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 6
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 6,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'MAB Mobile Banking',
                                    style: _type == 6
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/pay_images/uab.jpg',
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Center(
                    child: Text(
                      'Or Pay With',
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                      ),
                    ),
                  ),

                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _type = 7;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CardHomePage()),
                        );
                      });
                    },
                    child: Container(
                      width: size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        border: _type == 7
                            ? Border.all(width: 1, color: Colors.black)
                            : Border.all(width: 0.3, color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: 7,
                                    groupValue: _type,
                                    onChanged: _handleRadio,
                                    activeColor: Colors.blue[300],
                                  ),
                                  Text(
                                    'Credit Card',
                                    style: _type == 7
                                        ? GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)
                                        : GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFA4A4A4)),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.credit_card,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 70),

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

                  SizedBox(height: 30),


                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmOrderCredit()),
              );
            },

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[200],
              minimumSize: Size(180, 45),
              side: BorderSide.none,
              shape: StadiumBorder(),
            ),
            child: Text(
              'Confirm Payment',
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
