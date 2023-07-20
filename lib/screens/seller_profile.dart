import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test/pages/profile_page29.dart';

class ShowSellerProfile extends StatefulWidget {
  final String? userID;
  const ShowSellerProfile({required this.userID});

  @override
  State<ShowSellerProfile> createState() => _ShowSellerProfileState();
}

class _ShowSellerProfileState extends State<ShowSellerProfile> {
  String imageURL='';
  int FollowerCount= 0;
  @override
  void initState() {
    super.initState();
    fetchUserData(widget.userID);
  }

  Future<void> fetchUserData(String? userID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
          .collection('users').doc(userID).get();

      if (userSnapshot.exists) {
        String profileImageURL = userSnapshot.data()?['Profile Image'];
        int profileFollowers = userSnapshot.data()?['Followers Count'];
        setState(() {
          imageURL = profileImageURL;
          FollowerCount = profileFollowers;
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
    double size1 = 15.0;
    double fontbig = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 10.0;
    double fontsmall = size2 * MediaQuery.of(context).textScaleFactor;
    return
      Card(
      margin: EdgeInsets.all(0.0),
      elevation: 0,

      child:Padding(
        padding: const EdgeInsets.only(
            left: 7.0, right: 7.0),
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(()=> ProfilePage(userID: widget.userID));
              },
              child: Container(
                  height: screenHeight * 0.077,       //65
                  width: screenWidth * 0.4458 * 0.375,    //65
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:  imageURL.isNotEmpty ? NetworkImage(imageURL) : null,
                  )),
            ),

            Flexible(
              child: Text( FollowerCount.toString(),
                  style: TextStyle(
                      fontSize: size1,
                      color: Color(0xFF333333),
                      fontWeight:
                      FontWeight.bold)),
            ),

            Flexible(
              child: Text('Followers ',
                  style: TextStyle(
                      fontSize: size2,
                      color: Color(0xFF333333),
                      fontWeight:
                      FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

