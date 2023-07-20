import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test/pages/forgot_password-1.dart';
import 'package:test/pages/sign_up01.dart';
import 'package:test/pages/bottom_nav.dart';

class sign_in extends StatefulWidget{
  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  TextEditingController signinEmailCont = TextEditingController();
  TextEditingController signinPassCont = TextEditingController();
  bool checkbox = false;
  bool hidden = false;
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
              'Sign In',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
             Container(
              height: 45,
              child: TextField(
                controller: signinEmailCont,
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
                obscureText: !hidden,
                controller: signinPassCont,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        hidden=!hidden;
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
            SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: checkbox,
                  onChanged: (value) {
                    setState(() {
                      checkbox = !checkbox;
                    });
                  },
                ),
                Text(
                  'Remember me',
                  style: TextStyle(fontSize: 15),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(()=>forgot_password());
                  },
                  child: Text(
                    'Forgot Password?',
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
                onPressed: checkbox ? () async{
                  var email = signinEmailCont.text.trim();
                  var Password = signinPassCont.text.trim();

                  try {
                    final User? firebaseUser =  (await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: Password)
                    ).user;
                    if(firebaseUser != null){
                      Get.offAll(()=> BottomNav());
                    }
                    else {
                      Get.snackbar('Error Occurred', 'Check Your Email / Password');
                    }
                  }
                  on FirebaseAuthException catch(e)
                  {
                    Get.snackbar('Error Occurred', e.message.toString());
                  }
                } : null,
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
                // Image.asset(
                //   'assets/images/facebook.png',
                //   width: 25,
                //   height: 25,
                // ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: ()async{
                    GoogleSignInAccount? gUser;
                    GoogleSignInAuthentication? gAuth;
                    UserCredential? usercreds;
                    try
                    {
                      gUser = await GoogleSignIn().signIn();
                    } on FirebaseAuthException catch(e)
                    {
                      Get.snackbar('Error Occurred', e.message.toString());
                    }
                    try{
                      gAuth = await gUser!.authentication;
                    }on FirebaseAuthException catch(e)
                    {
                      Get.snackbar('Error Occurred', e.message.toString());
                    }

                    AuthCredential creds = GoogleAuthProvider.credential(
                        accessToken: gAuth?.accessToken,
                        idToken: gAuth?.idToken
                    );

                    try{
                      usercreds = await FirebaseAuth.instance.signInWithCredential(creds);
                      String? name = usercreds.user?.displayName;
                      List<String> parts = name!.split(' ',);
                      String? email = usercreds.user?.email;
                      String? image = usercreds.user?.photoURL;
                      User? userid = FirebaseAuth.instance.currentUser;
                      try
                      {
                        await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
                          'First Name' : parts[0],
                          'Last Name' : parts[1],
                          'Phone Number' : '+923107867878',
                          'Email': email,
                          'Password' : '',
                          'CreatedAt' : DateTime.now(),
                          'User ID': userid.uid,
                          'Profile Image': image,

                          'User name' : 'default user',
                          'Gender' : '',
                          'Birthday' : '1/1/20',
                          'Country' : 'Pakistan',
                          'Language' : 'English',
                          'Billing Address' : 'Lahore, Pakistan',
                          'Shipping Address' : '165H, PIA-society',
                          'Followers Count' : 1,

                        });
                      } on FirebaseAuthException catch(e)
                      {
                        Get.snackbar('Error Occurred', e.message.toString());
                      }

                    }on FirebaseAuthException catch(e)
                    {
                      Get.snackbar('Error Occurred', e.message.toString());
                    }

                    if(usercreds != null){
                      Get.offAll(()=> BottomNav());
                    }
                    else{
                      Get.snackbar('Error Occurred', 'Could not Login In');
                    }

                  },
                  child: Image.asset(
                    'assets/images/google.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                SizedBox(width: 20),
                // Image.asset(
                //   'assets/images/twitter.png',
                //   width: 25,
                //   height: 25,
                // ),
              ],
            ),
            Expanded(flex: 1, child: SizedBox()),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  onTap: (){
                      Get.to(()=> sign_up());
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


