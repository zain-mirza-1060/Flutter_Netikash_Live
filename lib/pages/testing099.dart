import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'dart:async';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_database/firebase_database.dart';

Future<void> readData(String f) async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('strings').get();
  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print('No data available.');
  }
}




// void storeString(String value) {
//   DatabaseReference databaseReference =
//   FirebaseDatabase.instance.ref().child('strings');
//   databaseReference.set(value).then((value) {
//     print('String stored successfully!');
//   }).catchError((error) {
//     print('Failed to store string: $error');
//   });
// }
//   final DatabaseReference _databaseRef = FirebaseDatabase.instance.reference().child('notifications');
//   void _createDatabase() {
//     // Create notifications database
//     _databaseRef.set({
//       '1': {
//         'notification_content': 'First notification',
//         'time': DateTime.now().toString(),
//       },
//       '2': {
//         'notification_content': 'Second notification',
//         'time': DateTime.now().toString(),
//       },
//       '3': {
//         'notification_content': 'Third notification',
//         'time': DateTime.now().toString(),
//       },
//     });
//   }


class t extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: (){
          readData('strings');
          //storeString('H9');
          //_createDatabase();
        }, child: Text('Hehe'),
      ),
    );
  }
}
