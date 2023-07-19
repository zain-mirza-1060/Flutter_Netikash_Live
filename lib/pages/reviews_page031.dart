import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Review_Page032.dart';

class review_page031 extends StatefulWidget {
  final String productID;

  review_page031({required this.productID});

  @override
  _review_page031State createState() => _review_page031State();
}

class _review_page031State extends State<review_page031> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            'Review',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: fetchProductReviews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("AZAM KHAN: LOAD");
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("AZAM KHAN: ERROR");
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final reviews = snapshot.data ?? [];
            if (reviews.isEmpty) {
              print("AZAM KHAN: EMPTY");
              return Center(child: Text('No Reviews Currently'));
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviews[index];
                      return ReviewCard(
                        profilePicture: 'assets/images/user.png',
                        name: 'Anonymous',
                        rating: 5.0,
                        time: 'a while ago',
                        review: review,
                      );
                    },
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey.shade300,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: Size(100, 50),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox(width: 20)),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(219, 185, 88, 0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              minimumSize: Size(100, 50),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Review_Page032(productID: widget.productID),
                                ),
                              );
                            },
                            child: Text(
                              'Add Review',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<String>> fetchProductReviews() async {
    print("AZAM KHAN: "+widget.productID);
    final querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .doc(widget.productID)
        .get();
    print("AZAM KHAN: 2");
    final reviews = querySnapshot.get('reviews') as List<dynamic>?;
    print("AZAM KHAN: 3");
    return reviews?.cast<String>() ?? [];
  }
}

class ReviewCard extends StatelessWidget {
  final String profilePicture;
  final String name;
  final double rating;
  final String time;
  final String review;

  ReviewCard({
    required this.profilePicture,
    required this.name,
    required this.rating,
    required this.time,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(profilePicture),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color.fromRGBO(219, 185, 88, 1),
                          ),
                          SizedBox(width: 2),
                          Text(rating.toString()),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Opacity(
                    opacity: 0.3,
                    child: Text(time),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                review,
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

