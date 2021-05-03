import 'package:covid_app/widgets/otpForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/widgets/loginForm.dart';
import 'package:covid_app/widgets/otpForm.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _number='';

  void getOTP(String number) {
    //first check if entry is already in db.
    //if yes then call api to get otp
    //if otp sent successfully then:
    //print(number);
    context.loaderOverlay.show();
    Future.delayed(Duration(seconds: 3), () {
      //simulating api call
      context.loaderOverlay.hide();
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP sent successfully')));
        pageContents.removeLast();
        pageContents.add(OTPForm(verifyOTP: verifyOTP, resendOTP: resendOTP,));
        _number=number;
      });
    });
  }

  void verifyOTP(String otp) {
    //we have number in the state and otp is supplied as parameter
    //verify otp is correct
    //if yes then, navigate to home screen.
    //if no then, take back to login screen
    //Navigator.pushReplacementNamed(context, '/login');
    context.loaderOverlay.show();
    Future.delayed(Duration(seconds: 3), ()
    {
      //simulating api call
      context.loaderOverlay.hide();
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  void resendOTP() {
    //we have number in state
    //resend otp on the number
    context.loaderOverlay.show();
    Future.delayed(Duration(seconds: 3), ()
    {
      //simulating api call
      context.loaderOverlay.hide();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP sent successfully')));
    });
  }

  List pageContents = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    //var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;

    pageContents = (pageContents.isEmpty) ? <Widget>[
      SizedBox(height: screenHeight*0.09),
      Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
          Expanded(
            flex: 1,
            child: Image.asset('assets/images/icon.png'),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          'Login to Covid App',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      LoginForm(getOTP: getOTP),
    ] : pageContents;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageContents,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
