import 'package:flutter/material.dart';
import 'package:test/screens/profile_product.dart';
ProfileProduct product1 = ProfileProduct(
    product: 'assets/images/shirt2.jpg',
    title: 'Men\' Basic White Cotton T..',
    newprice: '38.99',
    oldprice: '50',
    reviews: '180',
    orders: '780'
);ProfileProduct product2 = ProfileProduct(
    product: 'assets/images/shirt1.jpg',
    title: 'Female denim Casual Shirt ...',
    newprice: '20.99',
    oldprice: '30',
    reviews: '100',
    orders: '200'
);ProfileProduct product3 = ProfileProduct(
    product: 'assets/images/shirt3.jpg',
    title: 'Hollister Blue Dress Shirt ...',
    newprice: '79.99',
    oldprice: '120',
    reviews: '250',
    orders: '90'
);ProfileProduct product4 = ProfileProduct(
    product: 'assets/images/shirt4.jpg',
    title: 'Men\'s Blue Dress Shirt..',
    newprice: '29.99',
    oldprice: '50',
    reviews: '80',
    orders: '100'
);
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size1 = 14.0;
    double font1 = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 19.0;
    double font2 = size2 * MediaQuery.of(context).textScaleFactor;
    double size3 = 24.0;
    double font3 = size3 * MediaQuery.of(context).textScaleFactor;
    double size4 = 25.0;
    double font4 = size4 * MediaQuery.of(context).textScaleFactor;
    double size5 = 27.0;
    double font5 = size5 * MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color:Colors.black,size:30),
          onPressed: ()=> Navigator.pop(context),

        ),
        title: Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: font5,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz,color: Colors.black,size: 30,),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/images/profile1.jpg'),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Frank Nelson',
            style: TextStyle(
              fontSize: font4,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'User: mary255',
            style: TextStyle(
              fontSize: font2,
              fontWeight: FontWeight.w400,
              color: Colors.black87,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 100,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'Add product',
                style: TextStyle(
                  fontSize: font2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      '1563',
                      style: TextStyle(
                        fontSize: font3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Total Prod',
                      style: TextStyle(
                        fontSize: font1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '563',
                      style: TextStyle(
                        fontSize: font3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Total Sell',
                      style: TextStyle(
                        fontSize: font1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '146k',
                      style: TextStyle(
                        fontSize: font3,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontSize: font1,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),

              child: ListView(
                padding: EdgeInsets.only(top:20),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:35,right:35,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product',style: TextStyle(
                          fontSize: font3,
                          fontWeight: FontWeight.w500
                        ),),
                        Text('|',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('Recent',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('|',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                        Text('Videos',style: TextStyle(
                            fontSize: font3,
                            fontWeight: FontWeight.w500
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        // main row
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShowProfileProduct(profileproduct: product1),
                          SizedBox(width: 5),
                          ShowProfileProduct(profileproduct: product2),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        // main row
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShowProfileProduct(profileproduct: product3),
                          SizedBox(width: 5),
                          ShowProfileProduct(profileproduct: product4),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Row(
                        // main row
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShowProfileProduct(profileproduct: product1),
                          SizedBox(width: 5),
                          ShowProfileProduct(profileproduct: product2),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10, right: 10,bottom: 10),
                      child: Row(
                        // main row
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ShowProfileProduct(profileproduct: product4),
                          SizedBox(width: 5),
                          ShowProfileProduct(profileproduct: product3),
                        ],
                      )),
                  // Add more widgets to the list as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
