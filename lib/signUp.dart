import 'package:flutter/material.dart';
import 'signComponents/radio.dart';
import 'signComponents/checkbox.dart';

class SigningUpPage extends StatefulWidget {
  const SigningUpPage({super.key});

  @override
  State<SigningUpPage> createState() => _SigningUpPageState();
}

class _SigningUpPageState extends State<SigningUpPage>{

  final _formKey = GlobalKey<FormState>();
  String? _phone;
  String? _pwd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
            title: Text('StyleFeed Sign Up Page')
        ),

        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                              child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundImage: AssetImage('assets/logo.png'),
                                      radius: 100,
                                    ),
                                    SizedBox(
                                      height: 50.0,
                                      // color: Colors.grey[300],
                                    ),

                                    Text('Users Sign Up',
                                        style: TextStyle(
                                          // color: Colors.amber,
                                          letterSpacing: 2.0,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ]
                              )
                          ),

                          SizedBox(
                            height: 30.0,
                            // color: Colors.grey[300],
                          ),

                          Text('Email or Phone',
                              style: TextStyle(
                                // color: Colors.grey,
                                // letterSpacing: 2.0,
                              )),

                          TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'Enter Name',
                                  hintText: 'Email / Phone number'
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email or phone number';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _pwd = value;
                              }
                          ),

                          SizedBox(
                            height: 20.0,
                            // color: Colors.grey[300],
                          ),

                          Text('Username (Display Name)',
                              style: TextStyle(
                                // color: Colors.grey,
                                // letterSpacing: 2.0,
                              )),


                          TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'Enter Name',
                                  hintText: 'Enter the username'
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please fill out your display name';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _pwd = value;
                              }
                          ),

                          SizedBox(
                            height: 20.0,
                            // color: Colors.grey[300],
                          ),

                          GenderRadio(),

                          SizedBox(
                            height: 20.0,
                            // color: Colors.grey[300],
                          ),

                          Text('Password',
                              style: TextStyle(
                                // color: Colors.grey,
                                // letterSpacing: 2.0,
                              )),

                          TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'Enter Name',
                                  hintText: 'Enter your password here'
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password here';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _phone = value;
                              }),

                          SizedBox(
                            height: 20.0,
                            // color: Colors.grey[300],
                          ),

                          Text('Confirm your password',
                              style: TextStyle(
                                // color: Colors.grey,
                                // letterSpacing: 2.0,
                              )),

                          TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  // labelText: 'Enter Name',
                                  hintText: 'Enter your password here'
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password here';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _phone = value;
                              }),

                          SizedBox(
                            height: 10.0,
                          ),

                          CheckBox(),

                          SizedBox(
                            height: 10.0,
                          ),

                          SizedBox(
                            width: 400.0,
                            height: 50.0,
                            child: TextButton(
                                child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    // Validation succeeded, save and process the data
                                    _formKey.currentState!.save();
                                    // Perform additional actions, e.g., send data to a server
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.grey)
                                )
                            ),
                          ),

                          SizedBox(
                              height: 10
                          ),

                          Center(
                              child: Text(
                                  'or use one of your social profiles'
                              )
                          ),

                          SizedBox(
                              height: 10
                          ),

                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(
                                        width: 150.0,
                                        height: 50.0,
                                        child: TextButton(
                                            onPressed: (){},
                                            child: Text('Google', style: TextStyle(color: Colors.white)),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Colors.grey),
                                            )
                                        ),
                                      ),

                                      // SizedBox(
                                      //     width: 50.0
                                      // ),

                                      SizedBox(
                                        width: 150.0,
                                        height: 50.0,
                                        child: TextButton(
                                            onPressed: (){},
                                            child: Text('Facebook', style: TextStyle(color: Colors.white)),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Colors.grey),
                                            )
                                        ),
                                      ),
                                    ]
                                ),

                                SizedBox(
                                  height: 10.0,
                                ),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: (){
                                          //navigate to the page

                                        },
                                        child: Text('Forgot Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                                      ),

                                      InkWell(
                                        onTap: (){
                                          //navigate to the page
                                          Navigator.pushReplacementNamed(context, '/signIn');
                                        },
                                        child: Text('Sign In', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                                      ),
                                    ]
                                ),

                              ]
                          ),


                        ]
                    )
                )
            )
        )
    );
  }
}
