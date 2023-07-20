import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowHomeProduct extends StatefulWidget {
  final String? productID;
  const ShowHomeProduct({required this.productID});
  @override
  State<ShowHomeProduct> createState() => _ShowHomeProductState();
}
class _ShowHomeProductState extends State<ShowHomeProduct> {
  List<String> productImage = [];
  String newPrice='';
  String oldPrice='';
  String ordered='';
  String userID='';
  String userImage='';
  String userName='';
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
          .collection('products').doc(widget.productID).get();

      if (userSnapshot.exists) {
        List<String> list = convertListToStringArray(userSnapshot.data()?['imageUrls']);
        String oldprice = userSnapshot.data()?['productPrice'];
        String newprice = userSnapshot.data()?['discountPrice'];
        String orders = userSnapshot.data()?['ordered'];
        String userid = userSnapshot.data()?['userID'];
        setState(() {
          productImage = list;
          newPrice = newprice;
          oldPrice = oldprice;
          ordered = orders;
          userID = userid;
        });
      }

      DocumentSnapshot<Map<String, dynamic>> Snapshot = await FirebaseFirestore.instance
          .collection('users').doc(userID).get();

      if (userSnapshot.exists) {
        String profileImageURL = Snapshot.data()?['Profile Image'];
        String fname = Snapshot.data()?['First Name'];
        String lname = Snapshot.data()?['Last Name'];
        setState(() {
          userImage = profileImageURL;
          userName = fname + ' ' + lname;
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
    double size1 = 11.0;  //by
    double font1 = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 17.0;  //name
    double font2 = size2 * MediaQuery.of(context).textScaleFactor;
    double size3 = 20.0;  //newprice
    double font3 = size3 * MediaQuery.of(context).textScaleFactor;
    double size4 = 14.0;  //oldprice , count
    double font4 = size4 * MediaQuery.of(context).textScaleFactor;
    double size5 = 16.0;  //Ordered
    double font5 = size5 * MediaQuery.of(context).textScaleFactor;
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0),
      child:Container(          // 210 x 175
        height: screenHeight * 0.2408,
        width: screenWidth * 0.4458,
        decoration: BoxDecoration(
          color: Color(0xFFE1E3E3),
          borderRadius: BorderRadius.circular(
              10.0), // Set the border radius
        ),
        child: Column(
          children: [
            Container(
                height: screenHeight * 0.2408 * 0.214,      // 45
                width: screenWidth * 0.4458,                // 175
                child: Row(
                  //text ki row
                  children: [
                    Container(
                        height: screenHeight * 0.2408 * 0.165,       //35
                        width: screenWidth * 0.4458 * 0.375,                //65
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: userImage.isNotEmpty ? NetworkImage(userImage ) : null,

                        )),
                    Container(

                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text('By',
                              style: TextStyle(
                                fontSize: font1,
                                color: Color(0xFF535454),
                                // fontWeight: FontWeight.bold
                              )),
                          Text(userName,
                              style: TextStyle(
                                  fontSize: font2,
                                  color: Colors.black,
                                  fontWeight:
                                  FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
              // image
                height: screenHeight * 0.2408 * 0.619,      // 130
                width: screenWidth * 0.4458,    //174
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    productImage[0] ,
                    fit: BoxFit.cover, // Optional image fit
                  ),
                )),
            Container(
              // text ki row
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.2408 * 0.165,   //35
                        width: screenWidth * 0.4458 * 0.6,           //105
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text('\$'+newPrice,
                                    style: TextStyle(
                                        fontSize: font5,
                                        color: Color(0xFFE8C435),
                                        fontWeight:
                                        FontWeight.bold)),
                              ],
                            ),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text('\$'+oldPrice,
                                    style: TextStyle(
                                      decoration: TextDecoration
                                          .lineThrough,
                                      fontSize: font4,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.bold
                                    )),
                              ],
                            )
                          ],
                        )),
                    Container(
                        height: screenHeight * 0.2408 * 0.166,       //35
                        width: screenWidth * 0.4458 * 0.4358,        //70
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            )
                        ),
                        // child: Expanded(
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Text('Ordered',
                                    style: TextStyle(
                                        fontSize: font5,
                                        color:
                                        Color(0xFFE8C435),
                                        fontWeight:
                                        FontWeight.bold)),
                                SizedBox(width: 10,),
                                Text(ordered,
                                    style: TextStyle(
                                        fontSize: font4,
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.bold)),
                              ],
                            )
                        )
                    ),
                    // )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }}
List<String> convertListToStringArray(List<dynamic> list) {
  List<String> stringArray = [];
  for (var element in list) {
    stringArray.add(element.toString());
  }
  if(stringArray.isEmpty){
    stringArray[0] = "#";
  }
  return stringArray;
}