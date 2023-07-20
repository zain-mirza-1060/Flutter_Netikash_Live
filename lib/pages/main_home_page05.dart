import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/screens/see_more.dart';
import 'package:test/screens/seller_profile.dart';
import 'package:test/screens/home_product.dart';
import 'package:test/screens/side_bar.dart';
import 'package:test/pages/profile_page29.dart';
import 'package:test/pages/product_page030.dart';
import 'package:test/pages/search_bar024.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});
  @override
  State<MainHomePage> createState() => _MainHomePageState();
}
class _MainHomePageState extends State<MainHomePage> {
  User? userid = FirebaseAuth.instance.currentUser;
  String imageURL='';
  @override
  void initState() {
    super.initState();
    fetchUserData(userid?.uid);
  }
  Future<void> fetchUserData(String? userID) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
          .collection('users').doc(userID).get();

      if (userSnapshot.exists) {
        String profileImageURL = userSnapshot.data()?['Profile Image'];
        setState(() {
          imageURL = profileImageURL;
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
      String notifications= '3';

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key:_scaffoldKey,
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:35.0),
              child: Container(
                height: 52,
                width: screenWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton( icon:Icon(Icons.more_horiz,size: 30,),
                      color: Color(0xFF333333),
                      onPressed: ()=> _scaffoldKey.currentState!.openDrawer(),
                    ),
                    Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Color(0xFFE1E3E3),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.search ,color:Color(0xFF333333)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> search_bar024()));
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Badge(
                      label: Text(notifications),
                      child: Icon(Icons.notifications_outlined,
                          size: 37, color: Color(0xFF333333)),
                      textColor: Colors.white,
                      backgroundColor: Color(0xFFffc364),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> ProfilePage(userID: userid?.uid));
                      },
                      child: Container(
                        height: 52,
                        width: 52,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                          imageURL.isNotEmpty ? NetworkImage(imageURL) : null,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 220,
                width: screenWidth,
                child: Image(
                  image: AssetImage(
                    'assets/images/main.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ShowSeeMore(title: 'Category'),
            Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.110, //100
                      width: screenWidth,
                      child: StreamBuilder<QuerySnapshot> (
                        stream: FirebaseFirestore.instance.collection('users')
                            .orderBy('Followers Count', descending: true)
                            .limit(10).snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('');
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('');
                          }
                          final users = snapshot.data?.docs;

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: users?.length,
                            itemBuilder: (context, index) {
                              final userId = users?[index].id;
                              return ShowSellerProfile(userID: userId);
                            },
                          );
                        },
                      ),
                    )
                  ],
                )),
            ShowSeeMore(title: 'Feature Product'),
            Padding(
              padding: EdgeInsets.all(10),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('products').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('');
                  }
                  final products = snapshot.data?.docs;
                  if (products == null || products.isEmpty) {
                    return Text('');
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
                      return ShowHomeProduct(productID: productId);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      drawer: Drawer(
        child: ShowSideBar(),
        width: screenWidth * 0.6,
      ),
    );
  }
}
