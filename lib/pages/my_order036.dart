import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/pages/Order_Details037.dart';
import 'package:test/pages/product_page030.dart';

List<String> imageUrls = [];

class my_order036 extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Existing code...
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('orders')
         //   .where('userID', isEqualTo: _auth.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No orders found.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final order = snapshot.data!.docs[index];
              return Card(
                elevation: 1,
                child: FutureBuilder<DocumentSnapshot>(
                  future: _firestore
                      .collection('products')
                      .doc(order['productID'])
                      .get(),
                  builder: (context, productSnapshot) {
                    double_deplore(order['productID'].toString());
                    if (productSnapshot.hasError) {
                      return Text('Error: ${productSnapshot.error}');
                    }

                    if (productSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    final productData = productSnapshot.data?.data() as Map<String, dynamic>?;
                    final productName = productData?['productName'] as String?;
                   // final imageUrls = productData?['imageUrls'] as List<dynamic>?;
                    final ratings = productData?['ratings'] as String?;



                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signInAnonymously();
                    return FutureBuilder<DocumentSnapshot>(
                      future: _firestore
                          .collection('users')
                          .doc(order['userID'])
                          .get(),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.hasError) {
                          return Text('Error: ${userSnapshot.error}');
                        }

                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        final userData = userSnapshot.data?.data() as Map<String, dynamic>?;
                        final userName = userData?['User name'] as String?;

                        final orderDate = order['orderDate'];
                        final isOrderCompleted = false;

                        String? imageLoad1 = imageUrls?[0];
                        String imageLoad = imageLoad1.toString();

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Order_Details037(),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    'assets/images/product.png', // Replace with the correct path and name of your image file
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                    // Optional image fit
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0, bottom: 8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: CircleAvatar(
                                            radius: 35,
                                            backgroundImage: AssetImage('assets/images/user.png'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'by $userName',
                                      ),
                                    ],
                                  ),
                                  Text(
                                    productName.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '($ratings)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      '\$${(productData?['productPrice'] as String?).toString()}',
                                      style: TextStyle(
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                    ),
                                  ),
                                  Text("---------------------------------------------"),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Processing Date',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                isOrderCompleted
                                                    ? 'Order Completed'
                                                    : 'In Progress',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                orderDate.toString(),
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: SizedBox(width: 10)),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
void double_deplore(String productID) async {

  FirebaseAuth auth = FirebaseAuth.instance;
  auth.signInAnonymously();

  final productRef = FirebaseFirestore.instance.collection('products').doc(productID);
  final productData = await productRef.get();
  imageUrls = convertListToStringArray(productData['imageUrls']);

}