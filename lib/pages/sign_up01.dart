import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test/helper/signup_service.dart';
import 'package:test/pages/otp_page02.dart';
import 'package:test/pages/sign_in04.dart';
import 'package:country_picker/country_picker.dart';

class sign_up extends StatefulWidget{
  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {

  TextEditingController signupPhoneCont = TextEditingController();
  TextEditingController signupFnameCont = TextEditingController();
  TextEditingController signupLnameCont = TextEditingController();
  TextEditingController signupPassCont = TextEditingController();
  TextEditingController signupEmailCont = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: "92",
      countryCode: "PK",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Pakistan",
      example: "Pakistan",
      displayName: "Pakistan",
      displayNameNoCountryCode: "PAK",
      e164Key: "");

  bool checkbox = false ;
  bool hidden = false ;
  @override
  Widget build(BuildContext context) {
    signupPhoneCont.selection= TextSelection.fromPosition(TextPosition(offset: signupPhoneCont.text.length));
    // SignUpCreds signupCreds = SignUpCreds(
    //     Fname: '',
    //     Lname: '',
    //     phone: '',
    //     Password: ''
    // );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      width: 91,
                      height: 91,
                      child: Image.asset('assets/images/img.png')),
                ),
                Container(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Sign Up',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),),
                    ],
                  ),
                ),
                Container(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          child: TextField(
                            controller: signupFnameCont,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(219, 185, 88, 1),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(219, 185, 88, 1),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Add padding between the text fields
                      Expanded(
                        child: Container(
                          height: 45,
                          child: TextField(
                            controller: signupLnameCont,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(219, 185, 88, 1),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(219, 185, 88, 1),
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                      children: [
                        Container(
                            width: 120, // Adjust the width of the dropdown as needed
                            height: 45,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(219, 185, 88, 1),
                                borderRadius: BorderRadius.circular(5)
                            ),

                            child:Center(
                              child: InkWell(
                                onTap: (){
                                  showCountryPicker(
                                      context: context,
                                      countryListTheme: CountryListThemeData(
                                          bottomSheetHeight: 450
                                      ),
                                      onSelect: (value){
                                        setState(() {
                                          selectedCountry=value;
                                        });
                                      });
                                },
                                child: Text(
                                  "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                        ),
                        SizedBox(width: 10), // Add padding between the dropdown and text field
                        Expanded(
                          child: Container(
                            height: 45,
                            child: TextField(
                              controller: signupPhoneCont,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              onChanged: (value){
                                setState(() {
                                  signupPhoneCont.text = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                suffixIcon: signupPhoneCont.text.length >9 ? Container(
                                  height: 30,
                                  width: 30,
                                  child: Icon(Icons.done , size :25 , color:Color.fromRGBO(219, 185, 88, 1) ),
                                ) : null,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(219, 185, 88, 1),
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(219, 185, 88, 1),
                                    width: 3,
                                  ),
                                ),
                              ),
                            ),

                          ),
                        ),
                      ]
                  ),
                ),
                Container(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 45,
                    child: TextField(
                      controller: signupEmailCont,
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
                ),
                Container(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(219, 185, 88, 1),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      obscureText: !hidden,
                      controller: signupPassCont,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidden = !hidden;
                            });
                          },
                          child: Icon(
                            hidden ? Icons.visibility : Icons.visibility_off,
                            color: Color.fromRGBO(219, 185, 88, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor:Colors.white,
                        value: checkbox,
                        onChanged: (value){
                          setState(() {
                            checkbox = !checkbox;
                          });
                        },
                      ),
                      Container(width: 2,),
                      const Flexible(child: Text('By signing up you accept the Terms of service and Privacy Policy',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12), ))
                    ],
                  ),
                ),
                Container(height: 20,),
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
                    onPressed: checkbox ? () async{

                      var Fname = signupFnameCont.text.trim();
                      var Lname = signupLnameCont.text.trim();
                      var phoneNo = signupPhoneCont.text.trim();
                      var Email = signupEmailCont.text.trim();
                      var Pass = signupPassCont.text.trim();

                      // signupCreds.Fname = Fname;
                      // signupCreds.Lname = Lname;
                      // signupCreds.phone = '+${selectedCountry.phoneCode}$phoneNo';
                      // signupCreds.Password = Pass;
                      
                      try{
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: Email, password: Pass).
                            then((value) =>
                            SignUpService(Fname, Lname, '+${selectedCountry.phoneCode}$phoneNo', Email, Pass)
                        );
                        } on FirebaseAuthException catch(e)
                        {
                        Get.snackbar('Error Occurred', e.message.toString());
                        }

                      } : null,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Container(height: 40,),
                GestureDetector(
                  onTap: (){
                    Get.to(() => sign_in());
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [

                        TextSpan(
                          text: 'Already have an account? ',
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Color.fromRGBO(219, 185, 88, 1),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}
