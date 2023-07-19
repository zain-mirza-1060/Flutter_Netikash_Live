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
          .collection('users')
          .doc(userID)
          .get();

      if (userSnapshot.exists) {
        String profileImageURL = userSnapshot.data()?['Profile Image'];
        setState(() {
          imageURL = profileImageURL;
        });
      }
    } catch (error) {
      Get.snackbar('Error Loading Data', error.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
      String notifications= '3';

      SeeMore smore1 = SeeMore(
        name : 'Category'
      );
      SeeMore smore2 = SeeMore(
        name : 'Feature Product'
      );
    HomeProduct homeproduct1 = HomeProduct(
      profile: 'assets/images/profile4.jpg',
      product: 'assets/images/shirt2.jpg',
      name: 'Ryan Mendoza',
      newprice:'38.99',
      oldprice:'50',
      count: '780',
    );HomeProduct homeproduct2 = HomeProduct(
      profile: 'assets/images/profile1.jpg',
      product: 'assets/images/shirt1.jpg',
      name: 'Alice Reyes',
      newprice:'49.9',
      oldprice:'69.9',
      count: '80',
    );HomeProduct homeproduct3 = HomeProduct(
      profile: 'assets/images/profile1.jpg',
      product: 'assets/images/shirt3.jpg',
      name: 'Keanu Reevs',
      newprice:'19.99',
      oldprice:'30',
      count: '900',
    );HomeProduct homeproduct4 = HomeProduct(
      profile: 'assets/images/profile4.jpg',
      product: 'assets/images/shirt4.jpg',
      name: 'Rheana Mendive',
      newprice:'90.9',
      oldprice:'100',
      count: '78',
    );

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key:_scaffoldKey,
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
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
                ShowSeeMore(seemore:smore1),
                Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Row(
                      children: [
                        Container(
                          height: screenHeight * 0.110, //100
                          width: screenWidth,
                          child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance.collection('users')
                                .orderBy('Followers Count', descending: true)
                                .limit(10).snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error fetching user data');
                              }
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
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
                ShowSeeMore(seemore:smore2),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>product_page030()));
                          },
                            child: ShowHomeProduct(homeproduct: homeproduct1)
                        ),
                        SizedBox(width: 5),
                        ShowHomeProduct(homeproduct: homeproduct2),

                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShowHomeProduct(homeproduct: homeproduct3),
                        SizedBox(width: 5),
                        ShowHomeProduct(homeproduct: homeproduct4),

                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShowHomeProduct(homeproduct: homeproduct1),
                        SizedBox(width: 5),
                        ShowHomeProduct(homeproduct: homeproduct2),

                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShowHomeProduct(homeproduct: homeproduct4),
                        SizedBox(width: 5),
                        ShowHomeProduct(homeproduct: homeproduct3),
                      ],
                    )),
              ],
            )
          ],
        ),
      drawer: Drawer(
        child: ShowSideBar(),
        width: screenWidth * 0.6,
      ),
    );
  }
}
