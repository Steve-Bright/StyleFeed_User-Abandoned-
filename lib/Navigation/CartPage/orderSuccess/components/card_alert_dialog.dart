import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../confirm_order_credit.dart';

class CardAlertDialog extends StatelessWidget {
  const CardAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 80.0,
          top: -90.0,
          child: Image.asset(
            'assets/icons/checked.png',
            height: 90,
            width: 90,
          ),
        ),

        Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Card Added Successfully',
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            Padding(
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
                  minimumSize: Size(250, 45
                  ),
                  side: BorderSide.none,
                  shape: StadiumBorder(),
                ),
                child: Text(
                  'Continue',
                  style: GoogleFonts.montserrat(
                    color: Colors.grey[800],
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

          ],
        ),
      ],
    ));
  }
}
