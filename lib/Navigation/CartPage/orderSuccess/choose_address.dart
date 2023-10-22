import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'dart:convert' show json;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'checkout_detail.dart';
import 'choose_payment_method.dart';

class LocationData {
  final Map<String, List<String>> data;

  LocationData(this.data);

  factory LocationData.fromJson(Map<String, dynamic> json) {
    final data = <String, List<String>>{};
    for (var key in json.keys) {
      data[key] = List<String>.from(json[key]);
    }
    return LocationData(data);
  }
}

class Address {
  String name;
  String phoneNumber;
  String streetAddress;
  String apartment;
  String region;
  String township;
  bool isSelected;

  Address({
    required this.name,
    required this.phoneNumber,
    required this.streetAddress,
    required this.apartment,
    required this.region,
    required this.township,
    this.isSelected = false,
  });
}



class AddressBook extends StatefulWidget {
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  final List<Address> addresses = [];
  LocationData? locationData;

  Future<void> loadLocationData() async {
    final String jsonString = await rootBundle.loadString('assets/myanmar-townships.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    setState(() {
      locationData = LocationData.fromJson(jsonMap);
    });
  }

  @override
  void initState() {
    super.initState();
    loadLocationData();
    addresses.add(
      Address(
        name: 'Wain Yan Linn',
        phoneNumber: '0123-456-7890',
        streetAddress: '123 Main St',
        apartment: 'Apt 101',
        region: 'Yangon Region',
        township: 'Dawbon',
      ),
    );
    addresses.add(
      Address(
        name: 'Moe Yan Htun',
        phoneNumber: '0987-654-3210',
        streetAddress: '456 Elm St',
        apartment: 'Suite 202',
        region: 'Yangon Region',
        township: 'Tamwe',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutDetail()),
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
            'Choose Address',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        for (var i = 0; i < addresses.length; i++) {
                          addresses[i].isSelected = i == index;
                        }
                      });
                    },
                    child: AddressTile(
                      address: addresses[index],
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditAddressScreen(
                              address: addresses[index],
                              onAddressUpdate: (updatedAddress) {
                                setState(() {
                                  addresses[index] = updatedAddress;
                                });
                              },
                              cities: locationData?.data.keys.toList() ?? [],
                              cityTownships: locationData?.data ?? {},
                              selectedRegion: addresses[index].region,
                              selectedTownship: addresses[index].township,
                            ),
                          ),
                        );
                      },
                      onDelete: () {
                        setState(() {
                          addresses.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,100),
              child: Container(
                width: 180,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green!),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddAddressScreen(
                            onAddressAdded: (newAddress) {
                              setState(() {
                                addresses.add(newAddress);
                              });
                            },
                            cities: locationData?.data.keys.toList() ?? [],
                            cityTownships: locationData?.data ?? {},
                            selectedRegion: '',
                            selectedTownship: '',
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.grey[800],
                      minimumSize: Size(130, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Icon(Icons.add),
                    label: Text("Add New Address"),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChoosePaymentMethod()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple[200],
              minimumSize: Size(100, 45),
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

class AddressTile extends StatelessWidget {
  final Address address;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  AddressTile({
    required this.address,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: address.isSelected ? Colors.green[50] : Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.fromLTRB(10,0,10,15),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.name,
                style: GoogleFonts.montserrat(
                  color: address.isSelected ? Colors.green[900]: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),


              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text(
                          'Edit',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(
                        'Delete',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 'edit') {
                    onEdit();
                  } else if (value == 'delete') {
                    onDelete();
                  }
                },
              ),


            ],
          ),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${address.phoneNumber}',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Street Address : ',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),

                  Text(
                    '${address.streetAddress}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Apartment/Unit : ',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    ' ${address.apartment}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Region/State : ',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),

                  Text(
                    '${address.region}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Township/City : ',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${address.township}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),

            ],
          ),

        ],
      ),
    );
  }
}

class EditAddressScreen extends StatefulWidget {
  final Address address;
  final Function(Address) onAddressUpdate;
  final List<String> cities;
  final Map<String, List<String>> cityTownships;
  String selectedRegion;
  String selectedTownship;

  EditAddressScreen({
    required this.address,
    required this.onAddressUpdate,
    required this.cities,
    required this.cityTownships,
    required this.selectedRegion,
    required this.selectedTownship,
  });

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController streetController;
  late TextEditingController apartmentController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.address.name);
    phoneController = TextEditingController(text: widget.address.phoneNumber);
    streetController = TextEditingController(text: widget.address.streetAddress);
    apartmentController = TextEditingController(text: widget.address.apartment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressBook()),
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
          'Edit Address',
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 15),

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
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: nameController,
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
                    prefixIcon:Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 40),

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
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Phone Number',
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
              SizedBox(height: 40),


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
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: streetController,
                  keyboardType: TextInputType.streetAddress,
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Your Street / Road Address',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey[400],
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                      prefixIcon: const Icon(
                        Icons.add_road,
                        color: Colors.grey,
                      )
                  ),

                ),
              ),
              SizedBox(height: 40),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Apartment / Building /Suite / Unit',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: apartmentController,
                  keyboardType: TextInputType.name,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Eg.Building No.5(A)',
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
              SizedBox(height: 40),

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
              SizedBox(height: 10),
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
                    value: widget.selectedRegion.isNotEmpty ? widget.selectedRegion : null,
                    hint: Text(
                      'Select State/Region',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[400],
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    items: widget.cities.isNotEmpty
                        ? widget.cities.map((String value) {
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
                        : [],
                    onChanged: (newValue) {
                      if (newValue.toString() != widget.selectedRegion) {
                        setState(() {
                          widget.selectedRegion = newValue!;
                          widget.selectedTownship = '';
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),

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
              SizedBox(height: 10),
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
                    value: widget.selectedTownship.isNotEmpty ? widget.selectedTownship : null,
                    hint: Text(
                      'Select City/Township',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[400],
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    items: widget.selectedRegion.isNotEmpty && widget.cityTownships.containsKey(widget.selectedRegion)
                        ? widget.cityTownships[widget.selectedRegion]!.map((String value) {
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
                        : [],
                    onChanged: (newValue) {
                      if (newValue.toString() != widget.selectedTownship) {
                        setState(() {
                          widget.selectedTownship = newValue!;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(0,10,0,20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple[200]!),
                borderRadius: BorderRadius.circular(30),

              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressBook()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.grey[800],
                  minimumSize: Size(130, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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
            ),

            ElevatedButton(
              onPressed: () {
                final updatedAddress = Address(
                  name: nameController.text,
                  phoneNumber: phoneController.text,
                  streetAddress: streetController.text,
                  apartment: apartmentController.text,
                  region: widget.selectedRegion,
                  township: widget.selectedTownship,
                );
                widget.onAddressUpdate(updatedAddress);
                Navigator.pop(context);
              },
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
      ),
    );
  }
}

class AddAddressScreen extends StatefulWidget {
  final Function(Address) onAddressAdded;
  final List<String> cities;
  final Map<String, List<String>> cityTownships;
  String selectedRegion;
  String selectedTownship;

  AddAddressScreen({
    required this.onAddressAdded,
    required this.cities,
    required this.cityTownships,
    required this.selectedRegion,
    required this.selectedTownship,
  });

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddressBook()),
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
          'Add New Address',
          style: GoogleFonts.montserrat(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 15),

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
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: nameController,
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
                    prefixIcon:Icon(
                      Icons.person_outline_rounded,
                      color: Colors.grey,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 40),

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
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Phone Number',
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
              SizedBox(height: 40),


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
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: streetController,
                  keyboardType: TextInputType.streetAddress,
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Your Street / Road Address',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.grey[400],
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                      prefixIcon: const Icon(
                        Icons.add_road,
                        color: Colors.grey,
                      )
                  ),

                ),
              ),
              SizedBox(height: 40),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Apartment / Building /Suite / Unit',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 55,
                width: MediaQuery.of(context).size.width / 1.12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: apartmentController,
                  keyboardType: TextInputType.name,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    hintText: 'Eg.Building No.5(A)',
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
              SizedBox(height: 40),

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
              SizedBox(height: 10),
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
                    value: widget.selectedRegion.isNotEmpty ? widget.selectedRegion : null,
                    hint: Text(
                      'Select State/Region',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[600],
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    items: widget.cities.isNotEmpty
                        ? widget.cities.map((String value) {
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
                        : [],
                    onChanged: (newValue) {
                      if (newValue.toString() != widget.selectedRegion) {
                        setState(() {
                          widget.selectedRegion = newValue!;
                          widget.selectedTownship = '';
                        });
                      }
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),

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
              SizedBox(height: 10),
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
                    value: widget.selectedTownship.isNotEmpty ? widget.selectedTownship : null,
                    hint: Text(
                      'Select City/Township',
                      style: GoogleFonts.montserrat(
                        color: Colors.grey[600],
                        fontSize: 11,
                        letterSpacing: 1,
                      ),
                    ),
                    items: widget.selectedRegion.isNotEmpty && widget.cityTownships.containsKey(widget.selectedRegion)
                        ? widget.cityTownships[widget.selectedRegion]!.map((String value) {
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
                        : [],
                    onChanged: (newValue) {
                      if (newValue.toString() != widget.selectedTownship) {
                        setState(() {
                          widget.selectedTownship = newValue!;
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(0,10,0,20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple[200]!),
                borderRadius: BorderRadius.circular(30),

              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressBook()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.grey[800],
                  minimumSize: Size(130, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
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
            ),


            ElevatedButton(
              onPressed: () {
                final newAddress = Address(
                  name: nameController.text,
                  phoneNumber: phoneController.text,
                  streetAddress: streetController.text,
                  apartment: apartmentController.text,
                  region: widget.selectedRegion,
                  township: widget.selectedTownship,
                );
                widget.onAddressAdded(newAddress);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[200],
                minimumSize: const Size(130, 45),
                side: BorderSide.none,
                shape: const StadiumBorder(),
              ),
              child: Text(
                'Add Address',
                style: GoogleFonts.montserrat(
                  color: Colors.grey[800],
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}