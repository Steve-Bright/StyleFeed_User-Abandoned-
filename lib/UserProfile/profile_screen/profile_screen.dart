import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_profile_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,overlays:[]);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Profile',
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
            padding: EdgeInsets.fromLTRB(1, 20, 1, 30),
            child: Column(
              children: [
                Profile(
                  imageUrl: 'assets/profile1.jpg',
                ),

                SizedBox(height: 13),
                Text(
                  'Jacob',
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.headlineSmall,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),

                Text(
                  'jacob123@gmail.com',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),

                ),
                SizedBox(height: 25),

                SizedBox(
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: (){
                          Navigator.pushNamed(context, '/editProfile');
                        }  ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple[200],
                          minimumSize: Size(170, 50),
                          side: BorderSide.none,
                          shape: StadiumBorder(),
                        ),
                        icon: Icon(Icons.edit),
                        label: Text(
                          'Edit Profile',
                          style: GoogleFonts.montserrat(
                            color: Colors.grey[800],
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),
                Divider(),
                SizedBox(height: 5),


                Container(
                  height: 120,
                  width: 400,
                  color: Color.fromRGBO(247, 246, 213, 0.25),
                  padding: EdgeInsets.fromLTRB(2, 10, 0, 10),
                  child: Column(
                    children: [
                      Text(
                        'My Orders',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox( height: 15),

                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: (){},
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.grey[700],
                                  size: 27,
                                ),

                                SizedBox(height: 8),

                                Text(
                                  'Unpaid',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            label: Text(
                              '', //'Label',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),

                          TextButton.icon(
                            onPressed: (){},
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.work_history_outlined,
                                  color: Colors.grey[700],
                                  size: 27,
                                ),

                                SizedBox(height: 8),

                                Text(
                                  'Processing',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            label: Text(
                              '', //'Label',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),

                          TextButton.icon(
                            onPressed: (){},
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.local_shipping_outlined,
                                  color: Colors.grey[700],
                                  size: 27,
                                ),

                                SizedBox(height: 8),

                                Text(
                                  'Shipped',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            label: Text(
                              '', //'Label',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),

                          TextButton.icon(
                            onPressed: (){},
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.rate_review_outlined,
                                  color: Colors.grey[700],
                                  size: 27,
                                ),

                                SizedBox(height: 8),

                                Text(
                                  'Review',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            label: Text(
                              '', //'Label',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),

                          TextButton.icon(
                            onPressed: (){},
                            icon: Column(
                              children: [
                                Icon(
                                  Icons.assignment_return_outlined,
                                  color: Colors.grey[700],
                                  size: 27,
                                ),

                                SizedBox(height: 8),

                                Text(
                                  'Returns',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            label: Text(
                              '', //'Label',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 5),
                Divider(),
                SizedBox(height: 15),


                //List
                ListInPFWidget(title: 'My WishList', icon: Icons.favorite, onPress:(){},),
                SizedBox(height: 13),
                ListInPFWidget(title: 'Voucher & Offers', icon: Icons.discount, onPress:(){},),
                SizedBox(height: 13),
                ListInPFWidget(title: 'Address Book', icon: Icons.add_location_alt, onPress:(){},),
                SizedBox(height: 13),
                ListInPFWidget(title: 'Payment Options', icon: Icons.attach_money, onPress:(){},),
                SizedBox(height: 13),
                ListInPFWidget(title: 'Settings', icon: Icons.settings, onPress:(){},),
                SizedBox(height: 13),
                ListInPFWidget(title: 'Log Out', icon: Icons.logout, textColor: Colors.red[400], endIcon: false, onPress:(){},),
              ],
            ),
          ),



        ),
      );

  }
}



class ListInPFWidget extends StatelessWidget {
  const ListInPFWidget({
    super.key,

    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor

  });

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.deepPurple.withOpacity(0.2),
        ),
        child: Icon(icon),
      ),
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      trailing: endIcon? Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.15),
        ),
        child: Icon(Icons.keyboard_arrow_right_rounded),
      ) : null,
    );
  }
}
