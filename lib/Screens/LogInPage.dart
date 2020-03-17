import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future<void> _sendCodeToPhoneNumber() async{
    final PhoneVerificationCompleted verificationCompleted= (AuthCredential user) { 
      setState(() {
        print("Inside _sendCodeToPHoneNumber : signInWithPjoneNumber auto succeeded : $user");
      });
    };

    final PhoneVerificationFailed verificationFailed = (AuthException authException) {
      setState(() {
        print('Phone number varification failed . Code : ${authException.code} . Message : ${authException.message}') ;
      });
    };

    final PhoneCodeSent codeSent = (String verifcationId , [int foreceResendingToken]) async{
      this.verificationId = verificationId ;
      print("Code sent to " + _phoneNumberController.text) ;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoReterivalTimeout = (String verificationId){
      this.verificationId = verificationId ;
      print('Timeout') ;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phoneNumberController.text, 
      timeout: const Duration(seconds  : 10), 
      verificationCompleted: verificationCompleted, 
      verificationFailed: verificationFailed, 
      codeSent: codeSent, 
      codeAutoRetrievalTimeout: codeAutoReterivalTimeout
      );
  }

  @override
  void initState() {
    super.initState() ;
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            new Image(
              height: ScreenUtil().setHeight(250.0),
              image: new AssetImage('assets/images/WhatsApp_Logo_1.png'),
            ),
            new TextField(
              controller: _phoneNumberController,

            ),
            new TextField(
              controller:  _smsCodeController,
            ),
            new OutlineButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Image(
                    height: ScreenUtil().setHeight(60.0),
                    image: new AssetImage('assets/images/Google_logo.jpg') 
                  ),                  
                  new Text(
                    "Sign in with Google",
                  ),
                ],
              ),
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)
              ),
            )
          ],
        ),
      ),
    );
  }
}