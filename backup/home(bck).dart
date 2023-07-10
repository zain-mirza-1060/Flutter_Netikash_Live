import 'package:flutter/material.dart';
import 'package:test/main.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.grey,
      // ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      top: 35.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.more_horiz,
                            size: 30, color: Color(0xFF333333)),
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 220,
                    width: screenWidth,
                    color: Colors.yellow,
                    child: Image(
                      image: AssetImage(
                        'assets/images/main.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          )),
                      Container(
                        child: Row(
                          children: [
                            Text('See More'), // Icon widget
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.grey,
                            ), // Text widget
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile2.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile3.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile4.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile1.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile2.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile1.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, right: 7.0),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                  height: 65,
                                                  width: 65,
                                                  child: CircleAvatar(
                                                    radius: 20,
                                                    backgroundImage: AssetImage(
                                                        'assets/images/profile3.jpg'),
                                                  )),
                                              SizedBox(height: 3),
                                              Text('145K ',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                              Text('Followers ',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Color(0xFF333333),
                                                      fontWeight:
                                                      FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ])
                                ]))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Feature Product',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                          )),
                      Container(
                        child: Row(
                          children: [
                            Text('See More'), // Icon widget
                            Icon(Icons.chevron_right_rounded,
                                color: Colors.grey), // Text widget
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding:
                    const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 210,
                          width: 175,
                          decoration: BoxDecoration(
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile4.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
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
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile1.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
                                  width: 174,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/shirt1.jpg', // Replace with the correct path and name of your image file
                                      fit: BoxFit.cover, // Optional image fit
                                    ),
                                  )),
                              Container(
                                // text ki row
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                    padding:
                    const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 210,
                          width: 175,
                          decoration: BoxDecoration(
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile1.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
                                  width: 174,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/shirt3.jpg', // Replace with the correct path and name of your image file
                                      fit: BoxFit.cover, // Optional image fit
                                    ),
                                  )),
                              Container(
                                // text ki row
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile4.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
                                  width: 174,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/shirt4.jpg', // Replace with the correct path and name of your image file
                                      fit: BoxFit.cover, // Optional image fit
                                    ),
                                  )),
                              Container(
                                // text ki row
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                    padding:
                    const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 210,
                          width: 175,
                          decoration: BoxDecoration(
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile4.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
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
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile1.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
                                  width: 174,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/shirt1.jpg', // Replace with the correct path and name of your image file
                                      fit: BoxFit.cover, // Optional image fit
                                    ),
                                  )),
                              Container(
                                // text ki row
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                    padding:
                    const EdgeInsets.only(top: 10, left: 10, right: 10),
                    child: Row(
                      // main row
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 210,
                          width: 175,
                          decoration: BoxDecoration(
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile1.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
                                  width: 174,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/shirt4.jpg', // Replace with the correct path and name of your image file
                                      fit: BoxFit.cover, // Optional image fit
                                    ),
                                  )),
                              Container(
                                // text ki row
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
                            color: Color(0xFFE1E3E3),
                            borderRadius: BorderRadius.circular(
                                10.0), // Set the border radius
                          ),
                          child: Column(
                            // card ka coloumn
                            children: [
                              Container(
                                  height: 45,
                                  width: 175,
                                  child: Row(
                                    //text ki row
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 65,
                                          child: CircleAvatar(
                                            radius: 10,
                                            backgroundImage: AssetImage(
                                                'assets/images/profile4.jpg'),
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
                                                  fontSize: 11,
                                                  color: Color(0xFF535454),
                                                  // fontWeight: FontWeight.bold
                                                )),
                                            Text('Ryan Mendoza ',
                                                style: TextStyle(
                                                    fontSize: 14,
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
                                  height: 130,
                                  width: 174,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: Image.asset(
                                      'assets/images/shirt3.jpg', // Replace with the correct path and name of your image file
                                      fit: BoxFit.cover, // Optional image fit
                                    ),
                                  )),
                              Container(
                                // text ki row
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 105,
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
                                                  Text('\$38.99',
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                  Text('\$50',
                                                      style: TextStyle(
                                                        decoration: TextDecoration
                                                            .lineThrough,
                                                        fontSize: 13,
                                                        color: Colors.black,
                                                        // fontWeight: FontWeight.bold
                                                      )),
                                                ],
                                              )
                                            ],
                                          )),
                                      Container(
                                        height: 35,
                                        width: 70,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              10.0), // Set the border radius
                                        ),
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
                                                            color:
                                                            Color(0xFFE8C435),
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
              ],
            )
          ],
        ));
  }
}
