import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;
import 'address_screen.dart';



class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  // Initialize variables to store selected values
  String selectedCity = '';
  String selectedTownship = '';

  // Initialize lists to store city and township data
  List<String> cities = [];
  Map<String, List<String>> cityTownships = {};

  @override
  void initState() {
    super.initState();
    // Load and parse the JSON data from the file
    loadTownshipsData();
  }

  Future<void> loadTownshipsData() async {
    final String jsonData = await rootBundle.loadString('assets/myanmar-townships.json');
    final Map<String, dynamic> data = json.decode(jsonData);

    data.forEach((region, townships) {
      cities.add(region);
      cityTownships[region] = List<String>.from(townships);
    });

    // Set the initial selected region and township
    // selectedCity = cities[0];
    // selectedTownship = cityTownships[selectedCity]![0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,overlays:[]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddressScreen()),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Add/Edit Address',
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
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
            child: Column(
              children: [

                const SizedBox(height: 50),

                Form(
                  child: Column(
                    children: [

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
                      const SizedBox(height: 10),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: 'Your Name',
                            hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey[400],
                              fontSize: 11,
                              letterSpacing: 1,
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outline_rounded,
                              color: Colors.grey,
                            ),
                          ),

                        ),
                      ),

                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Phone Number',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: 'Your Phone Number',
                            hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey[400],
                              fontSize: 11,
                              letterSpacing: 1,
                            ),
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
                          ),

                        ),
                      ),

                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Street Address',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: 'Your Street/Road Address',
                            hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey[400],
                              fontSize: 11,
                              letterSpacing: 1,
                            ),
                            prefixIcon: const Icon(
                              Icons.add_road,
                              color: Colors.grey,
                            ),
                          ),

                        ),
                      ),

                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Apartment / Building / Suite / Unit',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: 'Eg.Building No.5(A)...',
                            hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey[400],
                              fontSize: 11,
                              letterSpacing: 1,
                            ),
                            prefixIcon: const Icon(
                              Icons.apartment_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),



                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'State / Region',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            padding: EdgeInsets.fromLTRB(20, 0, 25, 0),
                            value: selectedCity.isNotEmpty ? selectedCity : null,
                            hint: Text(
                                'Select State/Region',
                              style: GoogleFonts.montserrat(
                                color: Colors.grey[400],
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ), // Add this line
                            items: cities.isNotEmpty
                                ? cities.map((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(
                                  value,
                                  style: GoogleFonts.montserrat(
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList()
                                : [], // Handle the case where cities is empty
                            onChanged: (newValue) {
                              if (newValue.toString() != selectedCity) {
                                setState(() {
                                  selectedCity = newValue!;
                                  selectedTownship = ''; // Add this line to fix the program
                                  // You can add code to update related township dropdown if needed.
                                });
                              }
                            },
                          ),
                        ),
                      ),




                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'City / Township',
                          style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            padding: EdgeInsets.fromLTRB(20, 0, 25, 0),
                            value: selectedTownship.isNotEmpty ? selectedTownship : null,
                            hint: Text(
                              'Select City/Township',
                              style: GoogleFonts.montserrat(
                                color: Colors.grey[400],
                                fontSize: 11,
                                letterSpacing: 1,
                              ),
                            ), // Add this line
                            items: selectedCity.isNotEmpty && cityTownships[selectedCity] != null
                                ? cityTownships[selectedCity]!.map(
                                  (String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              },
                            ).toList()
                                : [], // Handle the case where selectedCity is empty or has no townships
                            onChanged: (newValue) {
                              if (newValue.toString() != selectedTownship) {
                                setState(() {
                                  selectedTownship = newValue!;

                                  // You can add code to update related township dropdown if needed.
                                });
                              }
                            },
                          ),
                        ),
                      ),




                      const SizedBox(height: 30),

                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddressScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: const Size(130, 45),
                              side: const BorderSide(width: 1.5, color: Colors.grey),
                              shape: const StadiumBorder(),
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

                          const SizedBox(width: 40),

                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[200],
                              minimumSize: const Size(130, 45),
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
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
              ],
            ),

          ),
        ),

      ),

    );

  }
}