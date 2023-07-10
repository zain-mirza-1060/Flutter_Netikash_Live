import 'package:flutter/material.dart';
import 'package:test/screens/side_bar.dart';

class TopBar{
  final String image;
  final String notif;

  TopBar({
    required this.image,
    required this.notif,

  });
}
  class ShowTopBar extends StatelessWidget {
  final TopBar topbar;
  ShowTopBar({required this.topbar});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ],
      ),
    );
  }}