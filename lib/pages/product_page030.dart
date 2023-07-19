

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/payment_page034.dart';
import 'package:test/pages/reviews_page031.dart';


String productName = "";
String productPrice = "";
String availableColors = "";
String sellerAddress = "";
String userName = "";
String userID = "";
List<String> imageUrls = [];
String ratings = "";
String releaseDate = "";
int amount = 1;

class product_page030 extends StatelessWidget {

  String productID = "";
  product_page030({required this.productID});

  @override
  Widget build(BuildContext context) {
    deplore(productID);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),

        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Product Images
                Container(

                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                         imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          imageUrls[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                    ),
                    height: 170,

                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              productName,
                              //'iPhone 12 PRO',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '\$$productPrice',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'by $userName',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star, color: Colors.yellow),
                            Icon(Icons.star_border, color: Colors.yellow),
                            SizedBox(width: 5),
                            Text(
                              '($ratings Ratings)',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.blue,
                            ),
                            SizedBox(width: 5),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                            ),
                            Expanded(child: SizedBox(width: 10)),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      increment();
                                    },
                                  ),
                                  Text(
                                    '$amount',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      decrement();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle product details button press
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(219, 185, 88, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Product Details',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => review_page031(productID: productID,)));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Review',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(children: [SizedBox(height: 20),
                  Text(
                    'First Released Date: $releaseDate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Available Color Names: $availableColors',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Seller Address: $sellerAddress',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30),
                ],),
              ],
            ),
          ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size.fromHeight(70),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: Text('Cancel',
                      style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                ),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _orderProduct(productID);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>payment_page034()));
                    },

                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0), // Set the borderRadius to 0 for rectangle shape
                        ),
                        primary: Color.fromRGBO(219, 185, 88, 1)
                    ),
                    child: Text('Order',
                      style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],)

      ),
    );
  }
}

  void increment() {
    amount = amount + 1;
  }

  void decrement() {
    amount = amount - 1;
  }

  void deplore(String productID) async {

    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInAnonymously();

      //..............
      final productRef = FirebaseFirestore.instance.collection('products').doc(productID);
      final productData = await productRef.get();

      availableColors = productData['availableColors'];
      imageUrls = convertListToStringArray(productData['imageUrls']);
      productName = productData['productName'];
      productPrice = productData['productPrice'];
      releaseDate = productData['releaseDate'];
      sellerAddress = productData['sellerAddress'];
      userID = productData['userID'];
      ratings = productData['ratings'];

      print("HEHEHEHE");

      //...............

      final userRef2 = FirebaseFirestore.instance.collection('users').doc(userID);
      final userData = await userRef2.get();
      userName = userData['User name'];

      print("HEHEHEHEHE: $userName");

      //...............

  }

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

  Future<void> _orderProduct(String ProductID) async {

    String? midID = FirebaseAuth.instance.currentUser?.uid;
    String userID = "Anonymous";
    if(midID.toString()!=""){
      userID = midID.toString();
    }
    //.........................................................
    DateTime now = DateTime.now();
    int month = now.month + 1;
    int year = now.year;
    if (month > 12) {
      month = month % 12;
      year++;
    }
    String oneMonthLater = DateTime(year, month, now.day).toString();
    oneMonthLater = oneMonthLater.replaceRange(9, oneMonthLater.length-1, "");
    //.........................................................
    await FirebaseFirestore.instance.collection('orders').add({
      'orderDate': oneMonthLater,
      'productID': ProductID,
      'userID': userID,
    });
  }
