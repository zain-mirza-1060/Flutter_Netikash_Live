import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Review_Page032 extends StatefulWidget {
  String productID = "";
  Review_Page032({required this.productID});
  @override
  _Review_Page032State createState() => _Review_Page032State(productID: productID);
}
Color star1Color = Colors.grey;
Color star2Color = Colors.grey;
Color star3Color = Colors.grey;
Color star4Color = Colors.grey;
Color star5Color = Colors.grey;
class _Review_Page032State extends State<Review_Page032> {
  final _firestore = FirebaseFirestore.instance;
  String reviewText = '';
  String productID = "";
  _Review_Page032State({required this.productID});
  void handleStarRating(int rating) {
    setState(() {
      star1Color = rating >= 1 ? Colors.yellow : Colors.grey;
      star2Color = rating >= 2 ? Colors.yellow : Colors.grey;
      star3Color = rating >= 3 ? Colors.yellow : Colors.grey;
      star4Color = rating >= 4 ? Colors.yellow : Colors.grey;
      star5Color = rating >= 5 ? Colors.yellow : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Write a Review',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              children: [
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 1,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/product.png',
                                    width: 120,
                                    height: 100,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                                        child: CircleAvatar(
                                          // User's profile picture
                                          radius: 25,
                                          // Replace with the appropriate image source
                                          backgroundImage: AssetImage('assets/images/user.png'),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'by Harrey Be',
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'iPhone 12 Pro',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '(180)',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Text(
                                      '\$879',
                                      style: TextStyle(
                                        color: Color.fromRGBO(219, 185, 88, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Rating',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                handleStarRating(1);
                              },
                              child: Icon(
                                Icons.star_border,
                                color: star1Color,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                handleStarRating(2);
                              },
                              child: Icon(
                                Icons.star_border,
                                color: star2Color,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                handleStarRating(3);
                              },
                              child: Icon(
                                Icons.star_border,
                                color: star3Color,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                handleStarRating(4);
                              },
                              child: Icon(
                                Icons.star_border,
                                color: star4Color,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                handleStarRating(5);
                              },
                              child: Icon(
                                Icons.star_border,
                                color: star5Color,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Write your Review',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (text) {
                                reviewText = text;
                              },
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Would you like to write anything about this product?',
                                counterText: '0 characters', // Replace with character count logic
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                            child: Text(
                            'Remaining Characters',
                              style: TextStyle(
                              fontWeight: FontWeight.w600,
                              ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                ],
              ),
              Expanded(child: SizedBox(height: 20)),
                    Container(
                    width: double.infinity, // Take up all available horizontal space
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(219, 185, 88, 1), // Set RGB color
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Set desired border radius for rectangle shape
                    ),
                    ),
                    onPressed: () {
                    // Add the review to Firestore
                    _firestore.collection('products').doc(productID).update({
                    'reviews': FieldValue.arrayUnion([reviewText]),
                    });

                    // Navigate back to the previous screen
                    Navigator.pop(context);
                    },
                    child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Save Review',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                      ),
                  ),
                ),
              ),
            ),
          ]

        )
      ),
    );
  }
}

