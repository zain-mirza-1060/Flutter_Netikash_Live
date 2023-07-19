import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test/pages/sign_in04.dart';
import 'package:test/pages/sign_up01.dart';
import 'package:test/pages/bottom_nav.dart';


class forgot_password extends StatefulWidget{
  @override
  State<forgot_password> createState() => forgot_State();
}

class forgot_State extends State<forgot_password> {
  TextEditingController forgotEmailCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: SizedBox(height: 20)),
                Center(
                  child: Image.asset(
                    'assets/images/img.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                Expanded(flex: 1, child: SizedBox(height: 20)),
                Text(
                  'Enter your email here ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 45,
                  child: TextField(
                    controller: forgotEmailCont,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(219, 185, 88, 1),
                                width: 2
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(219, 185, 88, 1),
                              width: 3
                          ),)
                    ),
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
                    onPressed: () async{
                      var email = forgotEmailCont.text.trim();
                      try {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: email).
                        then((value) => {
                          Get.snackbar('Reset Password', 'Email sent'),
                          Get.offAll(()=> sign_in())
                        });
                      }
                      on FirebaseAuthException catch(e)
                      {
                        Get.snackbar('Error Occurred', e.message.toString());
                      }
                    },
                    child: Text(
                      'Verify Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 350,)
              ]
          ),
        )
    );

  }
}

