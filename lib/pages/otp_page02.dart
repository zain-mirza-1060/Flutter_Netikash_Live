import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:test/pages/success_page03.dart';
import 'package:test/pages/sign_in04.dart';


class otp_page extends StatefulWidget{
  final String phoneNo;
  const otp_page({super.key,required this.phoneNo});

  @override
  State<otp_page> createState() => _otp_pageState();
}

class _otp_pageState extends State<otp_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //appBar: ,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex:1, child: SizedBox(height: 40)),
            Image.asset(
              'assets/images/img.png',
              width: 110,
              height: 110,
            ),
            Expanded(flex: 2, child: SizedBox(height: 40)),
            Row(
              children: [
                Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Flexible(
                  child: Text(
                    'Please Enter The OTP sent on ' + widget.phoneNo,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Pinput(
              length: 6,
              showCursor: true,
              defaultPinTheme: PinTheme(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Color.fromRGBO(219, 185, 88, 1),
                    width: 3,
                  ),
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(219, 185, 88, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  minimumSize: Size(double.infinity, 45),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> success_page()));
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            Expanded(flex: 3, child: SizedBox(height: 80)),
            GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_in() ));
          },
            child:RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(text: 'Already have an account? '),
                  TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Color.fromRGBO(219, 185, 88, 1),
                    ),
                  ),
                ],
              ),
            ),
        )
          ],
        ),
      ),
    );
  }
}