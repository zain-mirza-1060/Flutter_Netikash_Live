import 'package:flutter/material.dart';

class SeeMore{
  final String name;

  SeeMore({
    required this.name,
  });
}
class ShowSeeMore extends StatelessWidget {
  final SeeMore seemore;

  const ShowSeeMore({required this.seemore});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0.0),

      child:Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(seemore.name,
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                )),
            Container(
              child: Row(
                children: [
                  Text('See More'), // Icon widget
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey,
                  ), // Text widget
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
