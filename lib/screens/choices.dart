import 'package:flutter/material.dart';

class Choices{
  final String text;
  final bool selected;
  Choices({
    required this.text,
    required this.selected,
  });
}
class ShowChoices extends StatelessWidget {
  final Choices choices;

  const ShowChoices({required this.choices});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: EdgeInsets.all(0.0),
        child: Container(
          width: 73,
          height: 40,
          decoration: BoxDecoration(
              color: Color(0xFFE1E3E3),
              borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(choices.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: choices.selected ? Color(0xFFE8C435) : Color(0xFF333333),
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    );

  }}