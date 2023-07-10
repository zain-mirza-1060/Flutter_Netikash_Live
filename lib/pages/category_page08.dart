import 'package:flutter/material.dart';
import 'package:test/screens/choices.dart';
import 'package:test/screens/category.dart';
import 'package:test/screens/category_product.dart';
import 'package:test/screens/side_bar.dart';
import 'package:test/pages/profile_page29.dart';
import 'package:test/pages/search_bar024.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

      String profile_image = 'assets/images/profile1.jpg';
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
    CategoryProduct product1 = CategoryProduct(
      product: 'assets/images/shirt2.jpg',
      title: 'Men\'s Basic White Tee..',
      newprice: '38.99',
      oldprice: '50',
      reviews: '180',
      orders: '780'
    );CategoryProduct product2 = CategoryProduct(
      product: 'assets/images/shirt1.jpg',
      title: 'Female denim Casual Shirt ...',
      newprice: '20.99',
      oldprice: '30',
      reviews: '100',
      orders: '200'
    );CategoryProduct product3 = CategoryProduct(
      product: 'assets/images/shirt3.jpg',
      title: 'Hollister Blue Dress Shirt ...',
      newprice: '79.99',
      oldprice: '120',
      reviews: '250',
      orders: '90'
    );CategoryProduct product4 = CategoryProduct(
      product: 'assets/images/shirt4.jpg',
      title: 'Men\'s Blue Dress Shirt..',
      newprice: '29.99',
      oldprice: '50',
      reviews: '80',
      orders: '100'
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
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCategoryProduct(categoryproduct: product1),
                    SizedBox(width: 5),
                    ShowCategoryProduct(categoryproduct: product2),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCategoryProduct(categoryproduct: product3),
                    SizedBox(width: 5),
                    ShowCategoryProduct(categoryproduct: product4),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCategoryProduct(categoryproduct: product1),
                    SizedBox(width: 5),
                    ShowCategoryProduct(categoryproduct: product2),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShowCategoryProduct(categoryproduct: product4),
                    SizedBox(width: 5),
                    ShowCategoryProduct(categoryproduct: product3),
                  ],
                )),
          ])
        ]),
      drawer: Drawer(
        child: ShowSideBar(sidebar: sidebar,),
        width:220,
      )
    );
  }
}
