import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/pages/sign_up01.dart';
import 'package:test/pages/bottom_nav.dart';


class sign_in extends StatefulWidget{
  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  TextEditingController signinPhoneCont = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    bool _passwordVisible = false;
    signinPhoneCont.selection= TextSelection.fromPosition(TextPosition(offset: signinPhoneCont.text.length));
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
              'Sign In',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
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
                          fontSize: 22,
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
                      controller: signinPhoneCont,
                      textAlign: TextAlign.start,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      onChanged: (value){
                        setState(() {
                          signinPhoneCont.text = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        suffixIcon: signinPhoneCont.text.length >9 ? Container(
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

            SizedBox(height: 20),
            Container(
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
                obscureText: !_passwordVisible,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // setState(() {
                      //   _passwordVisible = !_passwordVisible;
                      // } as Null Function(bool _passwordVisible));
                    },
                    child: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Color.fromRGBO(219, 185, 88, 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    // Handle checkbox value change
                  },
                ),
                Text(
                  'Remember me',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // Handle forget password click
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNav()));
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
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 15),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/facebook.png',
                  width: 25,
                  height: 25,
                ),
                SizedBox(width: 20),
                Image.asset(
                  'assets/images/google.png',
                  width: 25,
                  height: 25,
                ),
                SizedBox(width: 20),
                Image.asset(
                  'assets/images/twitter.png',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
            Expanded(flex: 1, child: SizedBox()),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_up() ));

                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(text: 'Don\'t Have an Account? '),
                        TextSpan(
                          text: 'Create new one',
                          style: TextStyle(
                            color: Color.fromRGBO(219, 185, 88, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

        ]
        ),
      )
      );

  }
}

