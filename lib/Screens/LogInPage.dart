import 'dart:ui';
import 'dart:wasm';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp_design/HomePage.dart';
import 'package:whatsapp_design/Services/Authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _countryCodeController;
  TextEditingController _phoneNumberController;
  String verificationId;

  @override
  void initState() {
    super.initState();
    _countryCodeController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  Future<void> verifyPhone() async {
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => TwoStepVerificationPage(verificationId)));
    };

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber:
              '+' + _countryCodeController.text + _phoneNumberController.text,
          timeout: const Duration(seconds: 10),
          verificationCompleted: (AuthCredential cred) {
            print(cred);
          },
          verificationFailed: (AuthException excep) {
            print(excep.toString());
          },
          codeSent: smsOTPSent,
          codeAutoRetrievalTimeout: null);
    } catch (exception) {}
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
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
                    "Verify your phone number",
                    style: new TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: new ScreenUtil().setSp(35.0),
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
                          controller: _countryCodeController,
                          autofocus: true,
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
                            controller: _phoneNumberController,
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
                  onPressed: () async {
                    // Send the new phone number to the b=databse and wait for the dummy passcode to be given by the User .
                    //verifyPhone();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TwoStepVerificationPage('') ));
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
      ),
    );
  }
}

class TwoStepVerificationPage extends StatefulWidget {
  String veificationId;

  TwoStepVerificationPage(this.veificationId);
  @override
  _TwoStepVerificationPageState createState() =>
      _TwoStepVerificationPageState();
}

class _TwoStepVerificationPageState extends State<TwoStepVerificationPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _smsCodeController = TextEditingController();

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
                    controller: _smsCodeController,
                    maxLength: 6,
                    autofocus: true,
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        helperText: "Enter a 6-digit passcode"),
                  ),
                ),
                new SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                new RaisedButton(
                  color: Theme.of(context).secondaryHeaderColor,
                  onPressed: () {
                    // Send the new phone number to the b=databse and wait for the dummy passcode to be given by the User .
                    _auth.currentUser().then((user) async {
                      if (user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      } else {
                        try {
                          // final AuthCredential credential =
                          //     PhoneAuthProvider.getCredential(
                          //         verificationId: widget.veificationId,
                          //         smsCode: _smsCodeController.text);
                          // final AuthResult user =
                          //     await _auth.signInWithCredential(credential);
                          // final FirebaseUser currenUser =
                          //     await _auth.currentUser();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                        } catch (e) {
                          print("Invalid Code >>>");
                        }
                      }
                    });
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
                  style: new TextStyle(color: Colors.grey),
                )
              ]),
        ),
      ),
    );
  }
}
