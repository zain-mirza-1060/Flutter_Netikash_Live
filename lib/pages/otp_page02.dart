// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';
// import 'package:test/helper/signup_service.dart';
//
// class SignUpCreds{
//    String Fname;
//    String Lname;
//    String phone;
//    String Password;
//
//   SignUpCreds({
//     required this.Fname,
//     required this.Lname,
//     required this.phone,
//     required this.Password,
//   });
// }
//
// class otp_page extends StatefulWidget{
//   final SignUpCreds signupcreds;
//   final String VerifyID;
//   const otp_page({required this.signupcreds , required this.VerifyID});
//
//   @override
//   State<otp_page> createState() => _otp_pageState();
// }
//
// class _otp_pageState extends State<otp_page> {
//   TextEditingController OTPCont = TextEditingController();
//   final FirebaseAuth auth = FirebaseAuth.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       //appBar: ,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(flex:1, child: SizedBox(height: 40)),
//             Image.asset(
//               'assets/images/img.png',
//               width: 110,
//               height: 110,
//             ),
//             Expanded(flex: 2, child: SizedBox(height: 40)),
//             Row(
//               children: [
//                 Text(
//                   'Enter OTP',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Flexible(
//                   child: Text(
//                     'Please Enter The OTP sent on ' + widget.signupcreds.phone ,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Pinput(
//               length: 6,
//               showCursor: true,
//               controller: OTPCont,
//               defaultPinTheme: PinTheme(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(
//                     color: Color.fromRGBO(219, 185, 88, 1),
//                     width: 3,
//                   ),
//                 ),
//                 textStyle: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600
//                 )
//               ),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Color.fromRGBO(219, 185, 88, 1),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                   padding: EdgeInsets.symmetric(horizontal: 20.0),
//                   minimumSize: Size(double.infinity, 45),
//                 ),
//                 onPressed: () async{
//                   var userotp = OTPCont.text.trim();
//                   try {
//                     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                         verificationId: widget.VerifyID
//                         , smsCode: userotp);
//                     await auth.signInWithCredential(credential).
//                     then((value) => {
//                       SignUpService(
//                       widget.signupcreds.Fname ,
//                       widget.signupcreds.Lname,
//                       widget.signupcreds.phone,
//                       widget.signupcreds.Password
//                       )
//                     });
//                   }
//                   on FirebaseAuthException catch(e)
//                   {
//                     Get.snackbar('Error Occurred', e.message.toString());
//                   }
//                 },
//                 child: Text(
//                   'Confirm',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16.0,
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(flex: 3, child: SizedBox(height: 80)),
//             GestureDetector(
//           onTap: (){
//             //Navigator.push(context, MaterialPageRoute(builder: (context)=>sign_in() ));
//
//           },
//             child:RichText(
//               text: TextSpan(
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//                 children: [
//                   TextSpan(text: 'Resend '),
//                   TextSpan(
//                     text: 'OTP',
//                     style: TextStyle(
//                       color: Color.fromRGBO(219, 185, 88, 1),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         )
//           ],
//         ),
//       ),
//     );
//   }
// }