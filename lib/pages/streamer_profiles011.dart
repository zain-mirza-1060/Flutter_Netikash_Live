import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:test/pages/join_screen.dart';
import 'package:videosdk/videosdk.dart';

import 'ils_screen.dart';

String ID_Read = "";
String PD_Read = "";
String UN_Read = "";

class streamer_profiles011 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    List<String> streamers = ['Streamer 1', 'Streamer 2'];
    List<String> desc = ['Streamer 1', 'Streamer 2'];
    List<String> totalfol = ["10", "20"];

    ID_Generator();
    PD_Generator();
    UN_Generator();



    streamers = splitStringOnCommas(UN_Read);
    desc = splitStringOnCommas(ID_Read);
    totalfol = splitStringOnCommas(PD_Read);



    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(285, 188, 85, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 100,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      // Handle my sellers button press
                    },
                    child: Text('Active'),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pink[300]!,
                        Colors.pink[100]!,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 100,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      // Handle go live button press
                    },
                    child: Text(
                      'Go Live',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 100,
                  height: 60,
                  child: TextButton(
                    onPressed: () {
                      // Handle my sellers button press
                    },
                    child: Text('My Sellers'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            for (int i=0;i<streamers.length-1;i++)
              LiveStreamerProfileCard(
                profilePicture: 'assets/images/user.png',
                streamerName: streamers[i],
                streamerDescription: desc[i],
                totalProducts: totalfol[i],
              ),

          ],
        ),
      ),
    );
  }
}


class LiveStreamerProfileCard extends StatelessWidget {
  final String profilePicture;
  final String streamerName;
  final String streamerDescription;
  final String totalProducts;

  LiveStreamerProfileCard({
    required this.profilePicture,
    required this.streamerName,
    required this.streamerDescription,
    required this.totalProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black12,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(profilePicture),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  streamerName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  streamerDescription,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '$totalProducts Products',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromRGBO(219, 185, 88, 1),
                ),
                color: Color.fromRGBO(219, 185, 88, 1),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_circle_right_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  String meetingId = streamerDescription;
                  var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
                  if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ILSScreen(
                          meetingId: meetingId,
                          token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI4MTUzNTllZC05NzllLTQ2NWYtYTRlZC1hMDQzNmExNmIyYWMiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY4OTEwNjE4NCwiZXhwIjoxODQ2ODk0MTg0fQ.AktPCxll1LvNvo4ElXbqpxGL4soMx55F1Q3rTvuTJog",
                          mode: Mode.CONFERENCE,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
void ID_Generator() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('Streamers').get();
  String value="";
  if (snapshot.exists) {
    value=snapshot.value.toString();
  } else {
    print('No data available.');
  }
  ID_Read = value;
}
void PD_Generator() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('Products').get();
  String value="";
  if (snapshot.exists) {
    value=snapshot.value.toString();
  } else {
    print('No data available.');
  }
  PD_Read = value;
}
void UN_Generator() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('Users').get();
  String value="";
  if (snapshot.exists) {
    value=snapshot.value.toString();
  } else {
    print('No data available.');
  }
  UN_Read = value;
}

List<String> splitStringOnCommas(String string) {
  if(string==""){
    List<String> strings = [];
    return strings;
  }
  List<String> strings = [];

  // Split the string on commas.
  List<String> splitStrings = string.split(',');

  // Add the split strings to the list.
  for (String splitString in splitStrings) {
    strings.add(splitString);
  }

  return strings;
}


