import 'package:flutter/material.dart';
import 'package:test/main.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(children: [
            Padding(
                padding: const EdgeInsets.only(
                  top: 35.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.more_horiz, size: 30, color: Color(0xFF333333)),
                    Container(
                        height: 35,
                        width: 220,
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFE1E3E3),
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 10.0),
                              prefixIcon: Icon(Icons.search,
                                  size: 30, color: Color(0xFF333333)),
                              hintText: 'Search',
                              hintStyle: TextStyle(fontSize: 17),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(
                                    color: Color(0xFFE1E3E3), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide:
                                BorderSide(color: Color(0xFFE1E3E3)),
                              )),
                          textAlignVertical: TextAlignVertical.center,
                        )),
                    Badge(
                      label: Text('3'),
                      child: Icon(Icons.notifications_outlined,
                          size: 37, color: Color(0xFF333333)),
                      textColor: Colors.white,
                      backgroundColor: Color(0xFFffc364),
                    ),

                    // Icon(Icons.person,size:45 , color: Colors.grey,),
                    Container(
                      height: 52,
                      width: 52,
                      // color: Colors.yellow,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage:
                        AssetImage('assets/images/profile1.jpg'),
                      ),
                    )
                  ],
                )),
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
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 30,
                                                  width: 30,
                                                  child: Center(
                                                    child: ColorFiltered(
                                                        colorFilter:
                                                        ColorFilter.mode(
                                                            Color(
                                                                0xFFE8C435),
                                                            BlendMode
                                                                .srcIn),
                                                        child: Image.asset(
                                                          'assets/icons/profile.png',
                                                          width: 24,
                                                          height: 24,
                                                        )),
                                                  )),
                                              // SizedBox(height: 3),
                                              Text('All ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFE8C435),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Categories ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFE8C435),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    height: 30,
                                                    width: 20,
                                                    child: ColorFiltered(
                                                      colorFilter: ColorFilter.mode(
                                                          Color(0xFFE8C435),
                                                          BlendMode
                                                              .srcIn), // Replace with the desired color

                                                      child: Image.asset(
                                                        'assets/icons/down.png',
                                                        width: 24,
                                                        height: 24,
                                                      ),
                                                    )),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/camera.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('Electronic',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Devices ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/usb-connection.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('Electronic',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Accessories',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/fridge.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('TV & Home ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Appliances',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/cosmetics.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('Health & ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Beauty',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/shopping-cart.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('Baby & ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Toys',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/grocery.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('Groceries',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('& Pets',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 7.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                child: Center(
                                                    child: Image.asset(
                                                      'assets/icons/profile.png',
                                                      width: 24,
                                                      height: 24,
                                                    )),
                                              ),
                                              // SizedBox(height: 3),
                                              Text('All ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Categories ',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: 30,
                                                  width: 20,
                                                  child: Image.asset(
                                                    'assets/icons/down.png',
                                                    width: 24,
                                                    height: 24,
                                                  ),
                                                ),
                                              ])
                                        ],
                                      ),
                                    ),
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
                  Container(
                    width: 73,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFE1E3E3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Recommended',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE8C435),
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 73,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFE1E3E3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Top-Ranking   for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 73,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFE1E3E3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Best Sell',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 73,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xFFE1E3E3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        'Just for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Row(
                  // main row
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 210,
                      width: 175,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                      child: Column(
                        // card ka coloumn
                        children: [
                          Container(
                            // image
                              height: 135,
                              width: 174,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/shirt2.jpg', // Replace with the correct path and name of your image file
                                  fit: BoxFit.cover, // Optional image fit
                                ),
                              )),
                          Container(
                            // text ki row
                              child: Row(
                                children: [
                                  Container(
                                      height: 75,
                                      width: 105,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 7.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        'Mens White Basic Tee ...',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                            Color(0xFF333333),
                                                            fontWeight:
                                                            FontWeight.w500)),
                                                  )
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$ 38.99',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                            Color(0xFFE8C435),
                                                            fontWeight:
                                                            FontWeight.bold)),
                                                  ],
                                                ),
                                                SizedBox(width: 10),
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                                  children: [
                                                    Text('\$50',
                                                        style: TextStyle(
                                                          decoration: TextDecoration
                                                              .lineThrough,
                                                          fontSize: 11,
                                                          color: Colors.black,
                                                          // fontWeight: FontWeight.bold
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            Row(children: [
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              Icon(Icons.star_border,
                                                  color: Color.fromRGBO(
                                                      219, 185, 88, 1),
                                                  size: 13),
                                              SizedBox(width: 3),
                                              Text(
                                                '(180)',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ])
                                          ],
                                        ),
                                      )),
                                  Container(
                                    height: 75,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE1E3E3),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        )),
                                    child: Expanded(
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
                                                        fontSize: 15,
                                                        color: Color(0xFFE8C435),
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                Text('780',
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ))),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                )),
          ])
        ]));
  }
}
