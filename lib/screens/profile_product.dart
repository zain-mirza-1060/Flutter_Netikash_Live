import 'package:flutter/material.dart';

class ProfileProduct{
  final String product;
  final String title;
  final String newprice;
  final String oldprice;
  final String reviews;
  final String orders;

  ProfileProduct({
    required this.product,
    required this.title,
    required this.newprice,
    required this.oldprice,
    required this.reviews,
    required this.orders,
  });
}
class ShowProfileProduct extends StatelessWidget {
  final ProfileProduct profileproduct;

  const ShowProfileProduct({required this.profileproduct});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size1 = 10.0;  //reviews
    double font1 = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 12.0;  //oldprice
    double font2 = size2 * MediaQuery.of(context).textScaleFactor;
    double size3 = 15.0;  // count
    double font3 = size3 * MediaQuery.of(context).textScaleFactor;
    double size4 = 17.0;  //ordered ,newprice
    double font4 = size4 * MediaQuery.of(context).textScaleFactor;
    double size5 = 19.0;  //title
    double font5 = size5 * MediaQuery.of(context).textScaleFactor;
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0.0),
      child:Container(
        height: screenHeight * 0.2408,  //210
        width: screenWidth * 0.4458,    //175
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), // Set the border radius
        ),
        child: Column(
          // card ka coloumn
          children: [
            Container(
                height: screenHeight * 0.2408 * 0.643,      // 135
                width: screenWidth * 0.4458,    //175
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(profileproduct.product,
                    fit: BoxFit.cover, // Optional image fit
                  ),
                )),
            Container(
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.2408 * 0.356,//75
                        width: screenWidth * 0.4458 * 0.8,  //10
                        color: Colors.grey[200],
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
                                      child: Text(profileproduct.title,
                                          style: TextStyle(
                                              fontSize: font5,
                                              color:
                                              Color(0xFF333333),
                                              fontWeight:
                                              FontWeight.w500),
                                        textScaleFactor: 0.8,
                                      ),
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
                                      Text('\$ '+ profileproduct.newprice,
                                          style: TextStyle(
                                              fontSize: font4,
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
                                      Text('\$ '+profileproduct.oldprice,
                                          style: TextStyle(
                                            decoration: TextDecoration
                                                .lineThrough,
                                            fontSize: font2,
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
                                  '('+profileproduct.reviews+')',
                                  style: TextStyle(
                                    fontSize: font1,
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
                          color: Colors.white,
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
                                          fontSize: font4,
                                          color: Color(0xFFE8C435),
                                          fontWeight:
                                          FontWeight.bold)),
                                  Text(profileproduct.orders,
                                      style: TextStyle(
                                          fontSize: font3,
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

    );
  }}