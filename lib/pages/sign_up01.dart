import 'package:flutter/material.dart';
import 'package:test/pages/otp_page02.dart';
import 'package:test/pages/sign_in04.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class SignUp extends State<MyHomePage> {
class sign_up extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool val = true;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:

        SingleChildScrollView(
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
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(219, 185, 88, 1),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color.fromRGBO(219, 185, 88, 1),
                                width: 1,
                              ),
                            ),
                            fillColor: Color.fromRGBO(219, 185, 88, 1),
                            filled: true,
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              value: 'def',
                              child: Text('A'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'abc',
                              child: Text('B'),
                            ),
                          ],
                          onChanged: (value) {
                            // Handle dropdown value change
                          },
                        ),
                      ),
                      SizedBox(width: 10), // Add padding between the dropdown and text field
                      Expanded(
                        child: Container(
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Phone Number',
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
                )
                ,

                Container(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 45,
                    child: TextField(
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
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Password',
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
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor:Colors.white,
                        value: val,
                        onChanged: (bool){

                        },
                      ),
                      Container(width: 2,),
                      const Flexible(child: Text('By signing up you accept the Terms of service and Privacy Policy', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12), ))
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> otp_page()));
                    },
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_in() ));
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
