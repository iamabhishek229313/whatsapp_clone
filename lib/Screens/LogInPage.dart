import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/Services/Authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _smsCodeController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String verificationId;

  Future<void> _sendCodeToPhoneNumber() async {
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential user) {
      setState(() {
        print(
            "Inside _sendCodeToPHoneNumber : signInWithPjoneNumber auto succeeded : $user");
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        print(
            'Phone number varification failed . Code : ${authException.code} . Message : ${authException.message}');
      });
    };

    final PhoneCodeSent codeSent =
        (String verifcationId, [int foreceResendingToken]) async {
      this.verificationId = verificationId;
      print("Code sent to " + _phoneNumberController.text);
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoReterivalTimeout =
        (String verificationId) {
      this.verificationId = verificationId;
      print('Timeout');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 10),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoReterivalTimeout);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Align(
                alignment: Alignment.center,
                child: new Text(
                  "Verify your phone number",
                  style: new TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontSize: ScreenUtil().setSp(35.0),
                      fontWeight: FontWeight.w500),
                ),
              ),
              new SizedBox(height: ScreenUtil().setHeight(40.0)),
              new Align(
                alignment: Alignment.center,
                child: new Text(
                  "WhatsApp will send an SMS message (carrier charges may apply) to verify your phone number , Enter your country code and phone number.",
                ),
              ),
              new SizedBox(height: ScreenUtil().setHeight(20.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                      flex: 2,
                      child: new TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                            prefix: new Icon(
                              Icons.add,
                              size: ScreenUtil().setHeight(20.0),
                            ),
                            hintText: "Code",
                            border: new OutlineInputBorder()),
                      ),
                    ),
                    new SizedBox(width: ScreenUtil().setWidth(20.0)),
                    new Expanded(
                        flex: 5,
                        child: new TextField(
                          keyboardType: TextInputType.number,
                          decoration: new InputDecoration(
                              hintText: "Phone Number",
                              border: new OutlineInputBorder()),
                        ))
                  ],
                ),
              ),
              new SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              new RaisedButton(
                color: Theme.of(context).secondaryHeaderColor,
                onPressed: () {
                  // Send the new phone number to the b=databse and wait for the dummy passcode to be given by the User .
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => TwoStepVerificationPage()));
                },
                child: new Text("NEXT",
                    style: new TextStyle(
                      color: Colors.white,
                    )),
              ),
              new SizedBox(
                height: ScreenUtil().setHeight(20.0),
              ),
              new Text(
                  "You must be at least 16 years old to register . Learn how WhatsApp works with the Facebook Companies.")
            ]),
      ),
    );
  }
}

class TwoStepVerificationPage extends StatefulWidget {
  @override
  _TwoStepVerificationPageState createState() =>
      _TwoStepVerificationPageState();
}

class _TwoStepVerificationPageState extends State<TwoStepVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
          child: new Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Align(
                  alignment: Alignment.center,
                  child: new Text(
                    "Two-step Verification",
                    style: new TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: ScreenUtil().setSp(35.0),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                new SizedBox(height: ScreenUtil().setHeight(40.0)),
                new Align(
                  alignment: Alignment.center,
                  child: new Text(
                    "This account is protected by two-step verification. Enter your passcode to complete registration.",
                  ),
                ),
                new SizedBox(height: ScreenUtil().setHeight(40.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: new TextField(
                    maxLength: 6,
                    autofocus: true,
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.number,
                    decoration:
                        new InputDecoration(border: new OutlineInputBorder(),
                        helperText: "Enter a 6-digit passcode"
                        ),

                  ),
                ),
                new SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                new RaisedButton(
                  color: Theme.of(context).secondaryHeaderColor,
                  onPressed: () {
                    // Send the new phone number to the b=databse and wait for the dummy passcode to be given by the User .
                  },
                  child: new Text("VERIFY",
                      style: new TextStyle(
                        color: Colors.white,
                      )),
                ),
                new SizedBox(
                  height: ScreenUtil().setHeight(20.0),
                ),
                new Text(
                    "You must be at least 16 years old to register . Learn how WhatsApp works with the Facebook Companies.",
                    style: new TextStyle(
                      color: Colors.grey
                    ),
                    )
              ]),
        ),
      ),
    );
  }
}
