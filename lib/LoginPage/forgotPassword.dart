import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password')
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Enter your email address or phone number', style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                      )
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email or phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10
                ),

                SizedBox(
                  width: 90,
                  height: 40,
                  // height: 80,
                  child: TextButton(
                    onPressed: (){
                      if (_formKey.currentState!.validate()) {
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
                                    Text('Email or Phone Number found', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  ],
                                )
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                                padding: EdgeInsets.all(16),
                                // height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.error, color: Colors.white,),
                                    SizedBox(width: 10),
                                    Text('Email or Phone number not found', style: TextStyle(fontSize: 18, color: Colors.white)),
                                  ],
                                )
                            ),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        );
                      }

                    },
                    child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue)
                    ),
                )
                ),

              ]
            ),
          )
        )
    );
  }
}
