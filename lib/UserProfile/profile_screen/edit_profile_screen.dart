import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart'; // Add this import
import 'package:google_fonts/google_fonts.dart';
import 'package:profile/profile.dart';
import 'profile_screen.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:path/path.dart';



class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  DateTime? selectedDate; // Variable to store the selected date
  String? selectedGender; // Variable to store the selected gender

  File? _image;
  // List of gender options
  final List<String> genderOptions = [
    'Male',
    'Female',
    'Others',
    'Prefer not to say',
  ];
  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Edit Profile Details',
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
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          _getImageFromGallery();
                        },
                        child: _image == null
                            ? Stack(
                          alignment: Alignment.center,
                          children: [
                            // Default Profile Image
                            Profile(
                              imageUrl: 'assets/profile1.jpg',
                            ),
                            // Pencil icon button for changing profile picture
                            Positioned(
                              bottom: 35,
                              right: 20,
                              child: InkWell(
                                onTap: () {
                                  _getImageFromGallery();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    color: Colors.green[600],
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                            : Stack(
                          alignment: Alignment.center,
                          children: [
                            // Dotted border with glowing effect
                            AvatarGlow(
                              glowColor: Color.fromARGB(255, 15, 233, 106),
                              endRadius: 75,
                              duration: Duration(milliseconds: 2000),
                              repeat: true,
                              showTwoGlows: true,
                              repeatPauseDuration: Duration(milliseconds: 100),
                              child: DottedBorder(
                                radius: Radius.circular(20),
                                color: Colors.purple,
                                strokeWidth: 8,
                                borderType: BorderType.Circle,
                                dashPattern: [1, 13],
                                strokeCap: StrokeCap.butt,
                                child: Center(
                                  child: SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: CircleAvatar(
                                      backgroundImage: FileImage(_image!),
                                      radius: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Pencil icon button for changing profile picture
                            Positioned(
                              bottom: 20,
                              right: 8,
                              child: InkWell(
                                onTap: () {
                                  _getImageFromGallery();
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    color: Colors.green[600],
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Full Name',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Your Name',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Email',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Your Email',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.mail_outline_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Phone',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Add Phone Number',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      prefixIcon: Icon(
                        Icons.local_phone_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Gender',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: selectedGender,
                    items: genderOptions.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(
                          gender,
                          style: GoogleFonts.montserrat(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Select Gender',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'BirthDate',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.12,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((pickedDate) {
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      });
                    },
                    child: TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        hintText: selectedDate != null
                            ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                            : 'Select Date',
                        hintStyle: GoogleFonts.montserrat(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        prefixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ListInPFWidget(
                  title: 'Change Password?',
                  icon: Icons.lock_rounded,
                  onPress: () {},
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: Size(130, 45),
                        side: BorderSide(width: 1.5, color: Colors.grey),
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple[200],
                        minimumSize: Size(130, 45),
                        side: BorderSide.none,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        'Save',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey[800],
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
