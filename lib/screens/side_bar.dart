import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:test/pages/category_page08.dart';
import 'package:test/screens/side_button.dart';
import 'package:test/pages/sign_in04.dart';
import 'package:test/pages/bottom_nav.dart';
import 'package:test/pages/my_order036.dart';
import 'package:test/pages/setting_page040.dart';
import '../pages/join_screen.dart';

SideButton sidebutton2 = SideButton(
    icon: 'assets/icons/menu.png',
    text: 'Category',
);SideButton sidebutton3 = SideButton(
    icon: 'assets/icons/shopping-trolley.png',
    text: 'Your Cart',
);SideButton sidebutton4 = SideButton(
    icon: 'assets/icons/clipboard.png',
    text: 'My Order',
);SideButton sidebutton5 = SideButton(
    icon: 'assets/icons/play.png',
    text: 'My Live',
);SideButton sidebutton6 = SideButton(
    icon: 'assets/icons/settings.png',
    text: 'Settings',
);SideButton sidebutton7 = SideButton(
    icon: 'assets/icons/shield.png',
    text: 'Privacy',
);SideButton sidebutton8 = SideButton(
    icon: 'assets/icons/information.png',
    text: 'Help',
);SideButton sidebutton9 = SideButton(
    icon: 'assets/icons/log-out.png',
    text: 'Sign Out',
);
class ShowSideBar extends StatefulWidget {

  @override
  State<ShowSideBar> createState() => _ShowSideBarState();
}

class _ShowSideBarState extends State<ShowSideBar> {
  String? userID = FirebaseAuth.instance.currentUser?.uid;
  String imageURL='';
  String displayName= '';
  String BillAddress= '';
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
          .collection('users').doc(userID).get();

      if (userSnapshot.exists) {
        String profileImageURL = userSnapshot.data()?['Profile Image'];
        String fname = userSnapshot.data()?['First Name'];
        String lname = userSnapshot.data()?['Last Name'];
        String billAddress = userSnapshot.data()?['Billing Address'];
        setState(() {
          imageURL = profileImageURL;
          displayName = fname + ' ' + lname;
          BillAddress = billAddress;
        });
      }
    } catch (error) {
      // Get.snackbar('Error Loading Data', error.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size = 25.0;  //title
    double font = size * MediaQuery.of(context).textScaleFactor;
    bool home=false;
    return Card(
        elevation: 1,
        margin: EdgeInsets.all(0.0),
        child:ListView(
        children:[
          Container(
            width: screenWidth,
            color: Color(0xFFEBEEF7),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton( icon:Icon(Icons.close,size: 30,),
                          color: Color(0xFF333333),
                          onPressed: ()=> Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 65,
                                  width: 65,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: imageURL.isNotEmpty ? NetworkImage(imageURL) : null,
                                  )),
                              SizedBox(height: 10),
                              Text(displayName,
                                  style: TextStyle(
                                      fontSize: 27,
                                      color: Color(0xFF333333),
                                      fontWeight:
                                      FontWeight.w700
                                  )),
                              Text(BillAddress,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF333333),
                                      fontWeight:
                                      FontWeight.w500
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: Container(

                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap:(){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top:15.0,left:15,right:15),
                                              child: Container(
                                                height:screenHeight * 0.05, //50
                                                width:screenWidth * 0.34,        //130
                                                decoration: BoxDecoration(
                                                  // color: Colors.orange,
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(
                                                    width: 2.0,
                                                    color: Color(0xFFE8C435),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:10),
                                                      child: Container(
                                                          width: screenWidth * 0.063,
                                                          child:  ColorFiltered(
                                                            colorFilter:
                                                            ColorFilter.mode(Color(0xFFE8C435), BlendMode.srcIn),
                                                            // ColorFilter.mode(Color(0xFF333333), BlendMode.srcIn),

                                                            child: Image.asset(
                                                              'assets/icons/home.png',
                                                              width: 20,
                                                              height: 24,
                                                            ),
                                                          )),
                                                    ),
                                                    SizedBox(width:10),
                                                    Text('Home',
                                                        style: TextStyle(
                                                            fontSize: font,
                                                            color: Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.w500
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                             Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryPage()));
                                          },
                                          child: ShowSideButton(sideButton: sidebutton2)
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>my_order036()));

                                          },
                                          child: ShowSideButton(sideButton: sidebutton3)
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>my_order036()));
                                        },
                                          child: ShowSideButton(sideButton: sidebutton4)
                                      ),
                                      GestureDetector(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>JoinScreen()));
                                          },
                                          child: ShowSideButton(sideButton: sidebutton5)
                                      ),
                                      GestureDetector(
                                          onTap:(){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>setting_page040()));
                                          },
                                          child: ShowSideButton(sideButton: sidebutton6)
                                      ),
                                      ShowSideButton(sideButton: sidebutton7),
                                      ShowSideButton(sideButton: sidebutton8),
                                    ],
                                  ),

                                ],
                              ),
                              SizedBox(height: 40),
                              GestureDetector(
                                onTap: ()async{
                                  await GoogleSignIn().signOut();
                                  FirebaseAuth.instance.signOut();
                                  Get.offAll(()=> sign_in());
                                },
                                  child: ShowSideButton(sideButton: sidebutton9)
                              ),
                          ],

                            ),

                      ),
                    ),

                ],
              ),
            ),
          ),
        ]
        )
        );

  }
}