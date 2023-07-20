import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/screens/choices.dart';
import 'package:test/screens/category.dart';
import 'package:test/screens/category_product.dart';
import 'package:test/screens/side_bar.dart';
import 'package:test/pages/profile_page29.dart';
import 'package:test/pages/search_bar024.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}
class _CategoryPageState extends State<CategoryPage> {
  String? userid = FirebaseAuth.instance.currentUser?.uid;
  String imageURL='';
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
          .collection('users').doc(userid).get();

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
      String notifications = '3';

    Choices choices1 = Choices(
      text: 'Recommended',
        selected:true
    );Choices choices2 = Choices(
      text: 'Top-Ranking   for you',
        selected:false
    );Choices choices3 = Choices(
      text: 'Best Seller',
        selected:false
    );Choices choices4 = Choices(
      text: 'Just for you',
        selected:false
    );
    Category category1 = Category(
      icon: 'assets/icons/profile.png',
      name: 'All Categories',
        selected:true
    );Category category2 = Category(
      icon: 'assets/icons/camera.png',
      name: 'Electronic Devices',
        selected:false
    );Category category3 = Category(
      icon: 'assets/icons/usb-connection.png',
      name: 'Electronic Accessories',
        selected:false
    );Category category4 = Category(
      icon: 'assets/icons/fridge.png',
      name: 'TV & Home Appliances',
        selected:false
    );Category category5 = Category(
      icon: 'assets/icons/cosmetics.png',
      name: 'Health & Beauty',
        selected:false
    );Category category6 = Category(
      icon: 'assets/icons/shopping-cart.png',
      name: 'Baby & Toys',
        selected:false
    );Category category7 = Category(
      icon: 'assets/icons/grocery.png',
      name: 'Groceries & Pets',
        selected:false
    );
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    User? userid = FirebaseAuth.instance.currentUser;

    return Scaffold(
        key:_scaffoldKey,
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(children: [
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
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  children: [
                    Container(
                        height: 100,
                        width: screenWidth,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShowCategory(category:category1),
                                    ShowCategory(category:category2),
                                    ShowCategory(category:category3),
                                    ShowCategory(category:category4),
                                    ShowCategory(category:category5),
                                    ShowCategory(category:category6),
                                    ShowCategory(category:category7),
                                  ])
                            ]))
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Evenly spaced containers
                children: [
                  ShowChoices(choices:choices1),
                  ShowChoices(choices:choices2),
                  ShowChoices(choices:choices3),
                  ShowChoices(choices:choices4),
                ],
              ),
            ),
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
                      return ShowCategoryProduct(productID: productId);
                    },
                  );
                },
              ),
            ),
          ])
        ]),
      drawer: Drawer(
        child: ShowSideBar(),
        width:220,
      )
    );
  }
}
