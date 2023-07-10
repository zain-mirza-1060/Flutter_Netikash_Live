import 'package:flutter/material.dart';

class Category{
  final String icon;
  final String name;
  final bool selected;
  Category({
    required this.icon,
    required this.name,
    required this.selected,
  });
}
class ShowCategory extends StatelessWidget {
  final Category category;

  const ShowCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    double size5 = 14.0;  //title
    double font = size5 * MediaQuery.of(context).textScaleFactor;
    return Card(
        elevation: 0,
        margin: EdgeInsets.all(0.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 7.0),
        child: Row(
          children: [
            Container(
              height:100,
              width:60,
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child: ColorFiltered(
                          colorFilter: category.selected ?
                          ColorFilter.mode(Color(0xFFE8C435), BlendMode.srcIn) :
                          ColorFilter.mode(Color(0xFF333333), BlendMode.srcIn),

                          child: Image.asset(category.icon,
                            width: 24,
                            height: 24,
                          ))
                  ),

                  Text(category.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font,
                              color: category.selected ? Color(0xFFE8C435) : Color(0xFF333333),
                              fontWeight:
                              FontWeight.bold)
                     ),

                ],
              ),
            ),
            Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 100,
                      width: 25,
                      child: ColorFiltered(
                        colorFilter: category.selected ?
                        ColorFilter.mode(Color(0xFFE8C435), BlendMode.srcIn) :
                        ColorFilter.mode(Color(0xFF333333), BlendMode.srcIn),

                        child: Image.asset(
                          'assets/icons/down.png',
                          width: 20,
                          height: 24,
                        ),
                      )),
                ])
          ],
        ),
      ),
    );}}