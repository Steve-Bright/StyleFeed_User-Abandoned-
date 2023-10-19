import 'package:flutter/material.dart';
import 'LoginPageComponents/radio.dart';
import 'LoginPageComponents/checkbox.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../Navigation/UserChatBox/utils/constants.dart';

class SigningUpPage extends StatefulWidget {
  const SigningUpPage({Key? key, required this.isRegistering}) : super(key: key);

  static Route<void> route({bool isRegistering = false}) {
    return MaterialPageRoute(
      builder: (context) => SigningUpPage(isRegistering: isRegistering),
    );
  }

  final bool isRegistering;

  @override
  State<SigningUpPage> createState() => _SigningUpPageState();
}

class _SigningUpPageState extends State<SigningUpPage>{

  final bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  String? _phone;
  String? _pwd;

  Future<void> _signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;
    try {
      await supabase.auth.signUp(
          email: email, password: password, data: {'username': username});
      Navigator.pushReplacementNamed(context, '/userHome');
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
  }

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
                              controller: _emailController,
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
                              controller: _usernameController,
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
                              controller: _passwordController,
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
                                onPressed: _isLoading ? null : _signUp,
                                // onPressed: () {
                                //   if (_formKey.currentState!.validate()) {
                                //     // Validation succeeded, save and process the data
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       SnackBar(
                                //         content: Container(
                                //             padding: EdgeInsets.all(16),
                                //             // height: 90,
                                //             decoration: BoxDecoration(
                                //               color: Colors.green,
                                //               borderRadius: BorderRadius.all(Radius.circular(20)),
                                //             ),
                                //             child: Row(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               children: [
                                //                 Icon(Icons.check, color: Colors.white,),
                                //                 SizedBox(width: 10),
                                //                 Text('Sign Up Successful', style: TextStyle(fontSize: 18, color: Colors.white)),
                                //               ],
                                //             )
                                //         ),
                                //         backgroundColor: Colors.transparent,
                                //         elevation: 0,
                                //       ),
                                //     );
                                //       Navigator.pushReplacementNamed(context,'/userHome');
                                //     _formKey.currentState!.save();
                                //     // Perform additional actions, e.g., send data to a server
                                //   }
                                //   else{
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       SnackBar(
                                //         content: Container(
                                //             padding: EdgeInsets.all(16),
                                //             // height: 90,
                                //             decoration: BoxDecoration(
                                //               color: Colors.red,
                                //               borderRadius: BorderRadius.all(Radius.circular(20)),
                                //             ),
                                //             child: Row(
                                //               mainAxisAlignment: MainAxisAlignment.start,
                                //               children: [
                                //                 Icon(Icons.error, color: Colors.white,),
                                //                 SizedBox(width: 10),
                                //                 Text('Sign Up Unsuccessful', style: TextStyle(fontSize: 18, color: Colors.white)),
                                //               ],
                                //             )
                                //         ),
                                //         backgroundColor: Colors.transparent,
                                //         elevation: 0,
                                //       ),
                                //     );
                                //   }
                                // },
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
                                          //navigaforgotte to the page
                                          Navigator.pushNamed(context, '/forgotPassword');
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
