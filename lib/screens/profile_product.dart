import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowProfileProduct extends StatefulWidget {
  final String? productID;
  const ShowProfileProduct({required this.productID});

  @override
  State<ShowProfileProduct> createState() => _ShowProfileProductState();
}
class _ShowProfileProductState extends State<ShowProfileProduct> {
  List<String> productImage = [];
  String newPrice='';
  String title='';
  String rating='';
  String oldPrice='';
  String ordered='';
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Future<void> fetchData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await FirebaseFirestore.instance
          .collection('products').doc(widget.productID).get();

      if (userSnapshot.exists) {
        List<String> list = convertListToStringArray(userSnapshot.data()?['imageUrls']);
        String oldprice = userSnapshot.data()?['productPrice'];
        String newprice = userSnapshot.data()?['discountPrice'];
        String producttitle = userSnapshot.data()?['productName'];
        String ratings = userSnapshot.data()?['ratings'];
        String orders = userSnapshot.data()?['ordered'];
        setState(() {
          productImage = list;
          newPrice = newprice;
          oldPrice = oldprice;
          ordered = orders;
          title = producttitle;
          rating = ratings;
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
        height: screenHeight * 0.2408 ,  //210
        width: screenWidth * 0.4458, //175
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
                height: screenHeight * 0.2408 * 0.643,      // 135
                width: screenWidth * 0.4458,    //175
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    productImage[0],
                    fit: BoxFit.cover, // Optional image fit
                  ),
                )),
            Container(
                color: Colors.grey[200],
                child: Row(
                  children: [
                    Container(
                        height: screenHeight * 0.2408 * 0.356,//75
                        width: screenWidth * 0.4458 * 0.6,  //105
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
                                      child: Text(title,
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
                                      Text('\$ '+ newPrice,
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
                                      Text('\$ '+oldPrice,
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
                                  '('+rating+')',
                                  style: TextStyle(
                                    fontSize: font1,
                                  ),
                                ),
                              ])
                            ],
                          ),
                        )),
                    Container(
                      height: screenHeight * 0.2408 * 0.356,  //75
                      width: screenWidth * 0.4458 * 0.418,
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
                                  Text(ordered,
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
List<String> convertListToStringArray(List<dynamic> list) {
  List<String> stringArray = [];
  for (var element in list) {
    stringArray.add(element.toString());
  }
  if(stringArray.isEmpty){
    stringArray[0] = "#";
  }
  return stringArray;
}