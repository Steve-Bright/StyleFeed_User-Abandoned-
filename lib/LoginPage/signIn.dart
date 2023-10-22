import 'package:flutter/material.dart';
import '../Navigation/UserChatBox/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SigningInPage extends StatefulWidget {
  const SigningInPage({super.key});

  @override
  State<SigningInPage> createState() => _SigningInPageState();
}

class _SigningInPageState extends  State<SigningInPage>{

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacementNamed(context, '/userHome');
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (_) {
      context.showErrorSnackBar(message: unexpectedErrorMessage);
    }
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
            title: Text('StyleFeed Sign In Page')
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

                                    Text('Users Sign In',
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
                                // _pwd = value;
                              }
                          ),

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
                                // _phone = value;
                              }),

                          SizedBox(
                            height: 30.0,
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 50.0,
                            child: TextButton(
                                child: const Text('Sign In', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                                onPressed: _isLoading ? null : _signIn,
                                //onPressed: () {
                                  // if (_formKey.currentState!.validate()) {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //       content: Container(
                                  //           padding: EdgeInsets.all(16),
                                  //           // height: 90,
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.green,
                                  //             borderRadius: BorderRadius.all(Radius.circular(20)),
                                  //           ),
                                  //           child: Row(
                                  //             mainAxisAlignment: MainAxisAlignment.start,
                                  //             children: [
                                  //               Icon(Icons.check, color: Colors.white,),
                                  //               SizedBox(width: 10),
                                  //               Text('Login Successful', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  //             ],
                                  //           )
                                  //       ),
                                  //       backgroundColor: Colors.transparent,
                                  //       elevation: 0,
                                  //     ),
                                  //   );
                                  //   Navigator.pushReplacementNamed(context, '/userHome');
                                  //   _formKey.currentState!.save();
                                  //   // Perform additional actions, e.g., send data to a server
                                  // }
                                  // else {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     SnackBar(
                                  //       content: Container(
                                  //           padding: EdgeInsets.all(16),
                                  //           // height: 90,
                                  //           decoration: BoxDecoration(
                                  //             color: Colors.red,
                                  //             borderRadius: BorderRadius.all(Radius.circular(20)),
                                  //           ),
                                  //           child: Row(
                                  //             mainAxisAlignment: MainAxisAlignment.start,
                                  //             children: [
                                  //               Icon(Icons.error, color: Colors.white,),
                                  //               SizedBox(width: 10),
                                  //               Text('Login Unsuccessful', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  //             ],
                                  //           )
                                  //       ),
                                  //       backgroundColor: Colors.transparent,
                                  //       elevation: 0,
                                  //     ),
                                  //   );
                                  // }
                                //},
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
                                          Navigator.pushNamed(context, '/forgotPassword');
                                        },
                                        child: Text('Forgot Password', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                                      ),

                                      InkWell(
                                        onTap: (){
                                          //navigate to the page
                                          Navigator.pushReplacementNamed(context, '/signUp');
                                        },
                                        child: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                                      ),
                                    ]
                                ),


                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                    child: InkWell(
                                        onTap: (){
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Container(
                                                  padding: EdgeInsets.all(16),
                                                  // height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.check, color: Colors.white,),
                                                      SizedBox(width: 10),
                                                      Text('Logged in as a guest', style: TextStyle(fontSize: 18, color: Colors.white)),
                                                    ],
                                                  )
                                              ),
                                              backgroundColor: Colors.transparent,
                                              elevation: 0,
                                            ),
                                          );
                                          Navigator.pushReplacementNamed(context, '/userHome');
                                        },
                                        child: Text('Continue as a guest', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold))
                                    ),
                                  ),
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
