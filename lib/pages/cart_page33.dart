import 'package:flutter/material.dart';
import 'package:test/pages/profile_page29.dart';
import 'package:test/pages/search_bar024.dart';
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key:_scaffoldKey,

      body: Column(
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
                    label: Text('3'),
                    child: Icon(Icons.notifications_outlined,
                        size: 37, color: Color(0xFF333333)),
                    textColor: Colors.white,
                    backgroundColor: Color(0xFFffc364),
                  ),
                  Badge(
                    label: Text('3'),
                    child: Icon(Icons.notifications_outlined,
                        size: 37, color: Color(0xFF333333)),
                    textColor: Colors.white,
                    backgroundColor: Color(0xFFffc364),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/product.png'),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Google Pixel 4 2022 release...',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            '\$786',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.blue,
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.red,
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text('-'),
                Container(
                  width: 30,
                  height: 25,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ),
                Text('+'),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            color: Colors.grey[200],
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.delete,
              size: 50,
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  Text(
                    '\$150.00',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150,
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_control_key_rounded,
                  size: 40,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
