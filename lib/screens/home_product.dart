import 'package:flutter/material.dart';

class HomeProduct{
  final String profile;
  final String product;
  final String name;
  final String newprice;
  final String oldprice;
  final String count;

  HomeProduct({
    required this.profile,
    required this.product,
    required this.name,
    required this.newprice,
    required this.oldprice,
    required this.count,
  });
}
class ShowHomeProduct extends StatelessWidget {
  final HomeProduct homeproduct;

  const ShowHomeProduct({required this.homeproduct});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size1 = 11.0;  //by
    double font1 = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 17.0;  //name
    double font2 = size2 * MediaQuery.of(context).textScaleFactor;
    double size3 = 20.0;  //newprice
    double font3 = size3 * MediaQuery.of(context).textScaleFactor;
    double size4 = 14.0;  //oldprice , count
    double font4 = size4 * MediaQuery.of(context).textScaleFactor;
    double size5 = 16.0;  //Ordered
    double font5 = size5 * MediaQuery.of(context).textScaleFactor;
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0.0),
      child:Container(          // 210 x 175
        height: screenHeight * 0.2408,
        width: screenWidth * 0.4458,
        decoration: BoxDecoration(
          color: Color(0xFFE1E3E3),
          borderRadius: BorderRadius.circular(
              10.0), // Set the border radius
        ),
        child: Column(
          // card ka coloumn
          children: [
            Container(
                height: screenHeight * 0.2408 * 0.214,      // 45
                width: screenWidth * 0.4458,                // 175
                child: Row(
                  //text ki row
                  children: [
                    Container(
                        height: screenHeight * 0.2408 * 0.165,       //35
                        width: screenWidth * 0.4458 * 0.375,                //65
                        child: CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(homeproduct.profile),
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
                                fontSize: font1,
                                color: Color(0xFF535454),
                                // fontWeight: FontWeight.bold
                              )),
                          Text(homeproduct.name,
                              style: TextStyle(
                                  fontSize: font2,
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
                height: screenHeight * 0.2408 * 0.619,      // 130
                width: screenWidth * 0.4458,    //174
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(homeproduct.product,
                    fit: BoxFit.cover, // Optional image fit
                  ),
                )),
            Container(
              // text ki row
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.2408 * 0.165,   //35
                    width: screenWidth * 0.4458 * 0.6,           //105
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
                                Text('\$'+homeproduct.newprice,
                                    style: TextStyle(
                                        fontSize: font5,
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
                                Text('\$'+homeproduct.oldprice,
                                    style: TextStyle(
                                      decoration: TextDecoration
                                          .lineThrough,
                                      fontSize: font4,
                                      color: Colors.black,
                                      // fontWeight: FontWeight.bold
                                    )),
                              ],
                            )
                          ],
                        )),
                    Container(
                      height: screenHeight * 0.2408 * 0.166,       //35
                      width: screenWidth * 0.4458 * 0.4,        //70
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )
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
                                          fontSize: font5,
                                          color:
                                          Color(0xFFE8C435),
                                          fontWeight:
                                          FontWeight.bold)),
                                  SizedBox(width: 10,),
                                  Text('(' + homeproduct.count + ')',
                                      style: TextStyle(
                                          fontSize: font4,
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
