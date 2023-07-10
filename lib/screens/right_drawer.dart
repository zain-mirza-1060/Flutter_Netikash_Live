import 'package:flutter/material.dart';
class ShowRightDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size = 25.0; //title
    double font = size * MediaQuery.of(context).textScaleFactor;
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0.0),
      child: Padding(
        padding:
        EdgeInsets.only(top: 60), // Reduced top padding of the drawer
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Color(0xFFE1E3E3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.keyboard_control_key_rounded,size:30, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '     Beauty',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '     Type here',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                children: [
                  Icon(Icons.keyboard_control_key_rounded,size:30, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(
                    'Brand name',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Container(
                height: 37,
                width:screenWidth*0.5,// Reduced height of search bar
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '     Marvel',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                children: [
                  Icon(Icons.keyboard_control_key_rounded,size:30, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(
                    'Color & Size',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '     Color',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '     Size',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                children: [
                  Icon(Icons.keyboard_arrow_down_rounded,size:30, color: Color(0xFF333333)),
                  SizedBox(width: 10),
                  Text(
                    'Country',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                children: [
                  Icon(Icons.keyboard_control_key_rounded,size:30, color: Colors.amber),
                  SizedBox(width: 10),
                  Text(
                    'Price',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '     Min',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 37,
                      width:screenWidth*0.5,// Reduced height of search bar
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '     Max',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15), // Reduced height of the container
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> Navigator.pop(context),


                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                        ),
                          primary: Colors.white
                      ),
                      child: Text('Cancel', style: TextStyle(fontSize: 20, color: Colors.black),),
                    ),
                  ),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=> Navigator.pop(context),

                      style: ElevatedButton.styleFrom(
                          fixedSize: Size.fromHeight(70),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ), // Set the borderRadius to 0 for rectangle shape
                          ),
                          primary: Color.fromRGBO(219, 185, 88, 1)
                      ),
                      child: Text('Apply', style: TextStyle(fontSize: 20, color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
