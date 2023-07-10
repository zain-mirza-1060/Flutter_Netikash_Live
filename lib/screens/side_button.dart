import 'package:flutter/material.dart';

class SideButton{
  final String icon;
  final String text;

  SideButton({
    required this.icon,
    required this.text,
  });
}
class ShowSideButton extends StatelessWidget {
  final SideButton sideButton;

  const ShowSideButton({required this.sideButton});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double size = 25.0;  //title
    double font = size * MediaQuery.of(context).textScaleFactor;
    return Card(
      elevation: 0,
      color: Color(0xFFEBEEF7),
      margin: EdgeInsets.all(0.0),
      child:Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15.0,left:15,right:15),
            child: Container(
              height:screenHeight * 0.05, //50
              width:screenWidth * 0.34,        //130
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color:Color(0xFFEBEEF7),
                // color: Color(0xFFE8C435),
                // border: Border.all(

                //   width: 2.0, // Set the border width here
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Container(
                        width: screenWidth * 0.063, //25
                        child:  ColorFiltered(
                          colorFilter:
                          ColorFilter.mode(Color(0xFF636363), BlendMode.srcIn),
                          // ColorFilter.mode(Color(0xFFE8C435), BlendMode.srcIn),

                          child: Image.asset(sideButton.icon,
                            width: 20,
                            height: 24,
                          ),
                        )),
                  ),
                  SizedBox(width: 10,),
                  Text(sideButton.text,
                      style: TextStyle(
                          fontSize: font,
                          color: Color(0xFF636363),
                          fontWeight:
                          FontWeight.w500
                      )),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}