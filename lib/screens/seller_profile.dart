import 'package:flutter/material.dart';

class SellerProfile{
  final String image;
  final String count;

  SellerProfile({
    required this.image,
    required this.count,
  });
}

class ShowSellerProfile extends StatelessWidget {
  final SellerProfile sellerprofile;

  const ShowSellerProfile({required this.sellerprofile});

  @override
  Widget build(BuildContext context) {
    double size1 = 15.0;
    double fontbig = size1 * MediaQuery.of(context).textScaleFactor;
    double size2 = 10.0;
    double fontsmall = size2 * MediaQuery.of(context).textScaleFactor;
    return
      Card(
      margin: EdgeInsets.all(0.0),
      elevation: 0,

      child:Padding(
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
                  backgroundImage: AssetImage(sellerprofile.image),
                )),
            
            Flexible(
              child: Text(sellerprofile.count + 'K',
                  style: TextStyle(
                      fontSize: size1,
                      color: Color(0xFF333333),
                      fontWeight:
                      FontWeight.bold)),
            ),
            
            Flexible(
              child: Text('Followers ',
                  style: TextStyle(
                      fontSize: size2,
                      color: Color(0xFF333333),
                      fontWeight:
                      FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
