import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test/pages/bottom_nav.dart';
import 'package:image_picker/image_picker.dart';

enum Gender { male, female }
Gender? selectedGender ;

class setting_page040 extends StatefulWidget{
  @override
  State<setting_page040> createState() => _setting_page040State();
}
class _setting_page040State extends State<setting_page040> {
  TextEditingController setNameCont = TextEditingController();
  TextEditingController setuserNameCont = TextEditingController();
  TextEditingController setBdayCont = TextEditingController();
  TextEditingController setPhoneCont = TextEditingController();
  TextEditingController setNewPassCont = TextEditingController();
  TextEditingController setConfPassCont = TextEditingController();
  TextEditingController setShipAddCont = TextEditingController();
  TextEditingController setBillAddCont = TextEditingController();
  TextEditingController setCountryCont = TextEditingController();
  TextEditingController setLangCont = TextEditingController();

  String? userID = FirebaseAuth.instance.currentUser?.uid;
  File _selectedImage = File('');
  String newImageURL = '';
  String imageURL = '';

  String oldimageURL = '';
  String displayName = '';
  String userName = '';
  String genDer = '';
  String Birthday = '';
  String phoneNo = '';
  String Password = '';
  String ShipAddress = '';
  String BillAddress = '';
  String Country = '';
  String Language = '';

  bool uploaded = false;
  bool checkBox = false;
  bool check1 = false;
  bool check2 = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      if (userID != null) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userData = userSnapshot.data();
          if (userData != null) {
            String? profileImageURL = userData['Profile Image'];
            String? fname = userData['First Name'];
            String? lname = userData['Last Name'];
            String? uname = userData['User name'];
            String? gender = userData['Gender'];
            String? birthday = userData['Birthday'];
            String? phoneNum = userData['Phone Number'];
            String? password = userData['Password'];
            String? shipaddress = userData['Shipping Address'];
            String? billaddress = userData['Billing Address'];
            String? country = userData['Country'];
            String? language = userData['Language'];

            setState(() {
              oldimageURL = profileImageURL ?? '';
              displayName = (fname ?? '') + ' ' + (lname ?? '');
              userName = uname ?? '';
              genDer = gender ?? '';
              Birthday = birthday ?? 'dd/mm/yy';
              phoneNo = phoneNum ?? '';
              Password = password ?? '';
              ShipAddress = shipaddress ?? '';
              BillAddress = billaddress ?? '';
              Country = country ?? '';
              Language = language ?? '';

              imageURL = oldimageURL ?? '';
              if(genDer == 'male'){
                selectedGender= Gender.male;
              }
              else if (genDer == 'female') {
                selectedGender = Gender.female;
              }
            });
          }
        } else {
          print('User profile does not exist');
        }
      }
    } catch (error) {
      Get.snackbar('Error Loading Data', error.toString());
    }
  }
  Future<void> selectImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery,);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }
  Future<void> uploadImage() async {
    try{
      File selectedImage = _selectedImage;
      final imagePath = await FirebaseStorage.instance.ref().child('Profile')
          .child(DateTime.now().toString()).putFile(selectedImage);
      String imageUrl = await imagePath.ref.getDownloadURL();
      if(imageUrl != null){
        setState(() {
          newImageURL=imageUrl;
        });
      }
    }catch(error){
      Get.snackbar('Error Occurred', error.toString());
    }
  }
  Future<void> updateData() async {
    try
  {   List<String> parts;
      String username= userName ;
      String GenDer = selectedGender.toString();
      String birthDay = Birthday;
      String phoneno = phoneNo;
      String passWord = Password;
      String shipAddress = ShipAddress;
      String billAddress = BillAddress;
      String counTry = Country;
      String lanGuage = Language;
      if(setNameCont.text.isNotEmpty && setNameCont.text.trim() != displayName  ){
        String text = setNameCont.text.trim();
        parts = text!.split(' ',);
      }else{
        parts = displayName!.split(' ',);
      }
      if(setuserNameCont.text.isNotEmpty && setuserNameCont.text.trim() != userName  ){
         username = setuserNameCont.text.trim();
      }
      if(setBdayCont.text.isNotEmpty && setBdayCont.text.trim() != Birthday ){
        birthDay = setBdayCont.text.trim();
      }
      if(setPhoneCont.text.isNotEmpty && setPhoneCont.text.trim() != phoneNo ){
        phoneno = setPhoneCont.text.trim();
      }
      if(setNewPassCont.text.isNotEmpty && setNewPassCont.text.trim() != Password && setNewPassCont.text.trim() == setConfPassCont.text.trim() ){
        passWord = setNewPassCont.text.trim();
      }
      if(setShipAddCont.text.isNotEmpty && setShipAddCont.text.trim() != ShipAddress ){
        shipAddress = setShipAddCont.text.trim();
      }
      if(setBillAddCont.text.isNotEmpty && setBillAddCont.text.trim() != BillAddress ){
        billAddress = setBillAddCont.text.trim();
      }
      if(setCountryCont.text.isNotEmpty && setCountryCont.text.trim() != Country ){
        counTry = setCountryCont.text.trim();
      }
      if(setLangCont.text.isNotEmpty && setLangCont.text.trim() != Language ){
        lanGuage = setLangCont.text.trim();
      }
      await FirebaseFirestore.instance.collection("users").doc(userID).update({

        'Profile Image': uploaded ? newImageURL : oldimageURL,
        'First Name' : parts[0],
        'Last Name' : parts[1],
        'User name' : username,
        'Gender' : GenDer,
        'Birthday' : birthDay,
        'Phone Number' : phoneno,
        'Password' : passWord,
        'Shipping Address' : shipAddress,
        'Billing Address' : billAddress,
        'Country' : counTry,
        'Language' : lanGuage,

      });
    } on FirebaseAuthException catch(e)
    {
      Get.snackbar('Error Occurred', e.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.pop(context),

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:0,bottom: 20, left:20,right:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                        children:[ CircleAvatar(
                          radius: 45,
                          backgroundImage: imageURL.isNotEmpty ? NetworkImage(imageURL) : null,
                        ),
                          Positioned(
                            bottom: -15,
                            right: -15,
                            child: Checkbox(
                              value: checkBox,
                              onChanged: (value) {
                                setState(() {
                                  checkBox = !checkBox;
                                  if(checkBox && uploaded ){
                                    imageURL = newImageURL;
                                  }
                                  else{
                                    imageURL = oldimageURL;
                                  }
                                });
                              },
                            ),)
                        ]
                    ),
                  ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            uploadImage();
                            setState(() {
                              uploaded =true;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[300],

                          ),
                          child: Text('Upload',
                            style: TextStyle(color: Colors.black)
                          )),
                      SizedBox(width: 45,),
                      IconButton(
                        icon: Icon(Icons.camera_alt),
                        onPressed: (){
                          selectImage();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Press the Camera , then upload and then check the CheckBox for preview',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      color: Color.fromRGBO(219, 185, 88, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Full Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'User Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setNameCont,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hintText: displayName,
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,

                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setuserNameCont,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,
                              hintText: userName,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Gender',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Birthday',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Radio<Gender>(
                                    value: Gender.male,
                                    groupValue: selectedGender,
                                    onChanged: (Gender? value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                  Radio<Gender>(
                                    value: Gender.female,
                                    groupValue: selectedGender,
                                    onChanged: (Gender? value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setBdayCont,
                            keyboardType: TextInputType.datetime,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: Birthday,
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Phone Number',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 172,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: setPhoneCont,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white12,
                        hintText: phoneNo,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 10),
                  Text(
                'Password',
                style: TextStyle(
                  color: Color.fromRGBO(219, 185, 88, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Current Password',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 172,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(Password,
                      style: TextStyle(
                        fontSize: 18
                      ),
                  )
                )
              ),
              SizedBox(height: 10),
              Text(
                'Make sure your password is 8 characters long and contains letters and numbers',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'New password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: setNewPassCont,
                        obscureText: !check1,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          border: InputBorder.none,
                          fillColor: Colors.white12,
                          filled: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                check1=!check1;
                              });
                            },
                            child: Icon(
                              check1 ? Icons.visibility : Icons.visibility_off,
                              // color: Color.fromRGBO(219, 185, 88, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: setConfPassCont,
                        obscureText: !check2,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Confirm Pass',
                          border: InputBorder.none,
                          fillColor: Colors.white12,
                          filled: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                check2=!check2;
                              });
                            },
                            child: Icon(
                              check2 ? Icons.visibility : Icons.visibility_off,
                              // color: Color.fromRGBO(219, 185, 88, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Address Book',
                style: TextStyle(
                  color: Color.fromRGBO(219, 185, 88, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Shipping Address'),
                  //Spacer(),
                  SizedBox(width: 80,),
                  Text('Billing Address'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setShipAddCont,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hintText: ShipAddress,
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setBillAddCont,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hintText: BillAddress,
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 25),
              Text(
                'Country & Language',
                style: TextStyle(
                  color: Color.fromRGBO(219, 185, 88, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Change country',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Change Language',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setCountryCont,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              hintText: Country,
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: setLangCont,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: Language,
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: ()=> Navigator.pop(context),


                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text('Cancel', style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      updateData();
                      Get.offAll(()=> BottomNav());
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Set the borderRadius to 0 for rectangle shape
                      ),
                        primary: Color.fromRGBO(219, 185, 88, 1)
                    ),
                    child: Text('Save', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

