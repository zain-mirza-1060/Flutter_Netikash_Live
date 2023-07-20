import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/screens/profile_product.dart';
class ProfilePage extends StatefulWidget {
  final String? userID;
  const ProfilePage({required this.userID});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String imageURL = '';
  String displayName = '';
  String userName = '';
  int followerCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData(widget.userID);
  }

  Future<void> fetchData(String? userID) async {
    try {
      if (userID != null) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();

        if (userSnapshot.exists) {
          Map<String, dynamic>? userData = userSnapshot.data();
          if (userData != null) {
            String? profileImageURL = userData['Profile Image'];
            int? profileFollowers = userData['Followers Count'];
            String? fname = userData['First Name'];
            String? lname = userData['Last Name'];
            String? uname = userData['User name'];

            setState(() {
              imageURL = profileImageURL ?? '';
              followerCount = profileFollowers ?? 0;
              displayName = (fname ?? '') + ' ' + (lname ?? '');
              userName = uname ?? '';
            });
          }
        } else {
          print('User profile does not exist');
        }
      }
    } catch (error) {
      print('Error fetching user data: $error');
      Get.snackbar('Error Loading Data', error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size1 = 14.0;
    double font1 = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 19.0;
    double font2 = size2 * MediaQuery.of(context).textScaleFactor;
    double size3 = 24.0;
    double font3 = size3 * MediaQuery.of(context).textScaleFactor;
    double size4 = 25.0;
    double font4 = size4 * MediaQuery.of(context).textScaleFactor;
    double size5 = 27.0;
    double font5 = size5 * MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.black,size:30),
          onPressed: ()=> Navigator.pop(context),

        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: font5,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz,color: Colors.black,size: 30,),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 35,
              backgroundImage:  imageURL.isNotEmpty ? NetworkImage(imageURL) : null,
            ),
          ),
          SizedBox(height: 10),
          Text(
            displayName,
            style: TextStyle(
              fontSize: font4,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            userName,
            style: TextStyle(
              fontSize: font2,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Add product',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: font2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '1563',
                      style: TextStyle(
                        fontSize: font3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Total Prod',
                      style: TextStyle(
                        fontSize: font1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '563',
                      style: TextStyle(
                        fontSize: font3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Total Sell',
                      style: TextStyle(
                        fontSize: font1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      followerCount.toString(),
                      style: TextStyle(
                        fontSize: font3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: font1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),

              child: ListView(
                padding: EdgeInsets.only(top:20),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:35,right:35,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product',style: TextStyle(
                          fontSize: font3,
                          fontWeight: FontWeight.w500
                        ),),
                        Text('|',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('Recent',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('|',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('Videos',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('products').snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('error');
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text('');
                        }
                        final products = snapshot.data?.docs;
                        if (products == null || products.isEmpty) {
                          return Text('error');
                        }
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.8635,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final productId = products[index].id;
                            return ShowProfileProduct(productID: productId);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
