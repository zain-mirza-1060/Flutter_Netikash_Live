import 'package:flutter/material.dart';
import 'package:test/screens/see_more.dart';
import 'package:test/screens/seller_profile.dart';
import 'package:test/screens/home_product.dart';
import 'package:test/screens/side_bar.dart';
import 'package:test/pages/profile_page29.dart';
import 'package:test/pages/product_page030.dart';
import 'package:test/pages/search_bar024.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    // double sellerrow = 100.0;
    // double row1 = sellerrow * (screenHeight / 100);
      String profile_image = 'assets/images/profile1.jpg';
      String notifications= '3';

      SeeMore smore1 = SeeMore(
        name : 'Category'
      );
      SeeMore smore2 = SeeMore(
        name : 'Feature Product'
      );
      SellerProfile sellerprofile2 = SellerProfile(
      image: 'assets/images/profile2.jpg',
      count: '145',
      );SellerProfile sellerprofile1 = SellerProfile(
      image: 'assets/images/profile1.jpg',
      count: '300',
      );SellerProfile sellerprofile3 = SellerProfile(
      image: 'assets/images/profile3.jpg',
      count: '50',
      );SellerProfile sellerprofile4 = SellerProfile(
      image: 'assets/images/profile4.jpg',
      count: '20',
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
    SideBar sidebar = SideBar(
        profile: 'assets/images/profile1.jpg',
        name:'Frank Nelson',
        location: 'Barcelona, Venezuela'
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));

                          },
                          child: Container(
                            height: 52,
                            width: 52,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage(profile_image),
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
                            height: 100,
                            width: screenWidth,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                      ShowSellerProfile(sellerprofile:sellerprofile2),
                                      ShowSellerProfile(sellerprofile:sellerprofile3),
                                      //ShowSellerProfile(sellerprofile:sellerprofile4),
                                      ShowSellerProfile(sellerprofile:sellerprofile1),
                                      ShowSellerProfile(sellerprofile:sellerprofile2),
                                      ShowSellerProfile(sellerprofile:sellerprofile1),
                                      ShowSellerProfile(sellerprofile:sellerprofile3),

                                      ])
                                ]))
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
        child: ShowSideBar(sidebar: sidebar),
        width: 500,
      ),
    );
  }
}
