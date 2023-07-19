import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/pages/success_page03.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

SignUpService(String? fname, String? lname, String? phone,String? email, String password) async{
  User? userid = FirebaseAuth.instance.currentUser;
  try
      {
        SaveDefaultProfileImage();
        await FirebaseFirestore.instance.collection("users").doc(userid!.uid).set({
          'User ID': userid.uid,
          'CreatedAt' : DateTime.now(),
          'First Name' : fname,
          'Last Name' : lname,
          'Phone Number' : phone,
          'Email': email,
          'Password' : password,
          'User name' : 'default user',
          'Gender' : '',
          'Birthday' : '1/1/20',
          'Country' : 'Pakistan',
          'Language' : 'English',
          'Billing Address' : 'lahore, Pakistan',
          'Shipping Address' : '165H PIA-society',
          'Followers Count' : 1,

        }
        ).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.offAll(()=> success_page()),
        });
      } on FirebaseAuthException catch(e)
      {
        Get.snackbar('Error Occurred', e.message.toString());
      }
}
void SaveDefaultProfileImage() async {
  try {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('Profile/default_Profile.jpg');
    String defaultImage = await ref.getDownloadURL();

    User? userid = FirebaseAuth.instance.currentUser;
    DocumentReference current = FirebaseFirestore.instance.collection("users").doc(userid!.uid);

    await current.update({'Profile Image': defaultImage});

  } catch (error) {
    Get.snackbar('Error Occurred', 'Could not save data to FireStore');
  }
}
