import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'api_call.dart';
import 'ils_screen.dart';
import 'package:videosdk/videosdk.dart';

class JoinScreen extends StatelessWidget {
  final _meetingIdController = TextEditingController();
  final _meetingNameController = TextEditingController();

  JoinScreen({super.key});

  //Creates new Meeting Id and joins it in CONFERNCE mode.
  void onCreateButtonPressed(BuildContext context) async {
    String Prod_Name = _meetingNameController.text;
    if(!(Prod_Name=="")){
      // call api to create meeting and navigate to ILSScreen with meetingId,token and mode
      String mi = "";
      await createMeeting().then((meetingId) {
        mi = meetingId;
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ILSScreen(
              meetingId: meetingId,
              token: token,
              mode: Mode.CONFERENCE,
            ),
          ),
        );
      });
      bumpStreamer(mi, Prod_Name.replaceAll(",", ""));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please Enter Product Name You Sell"),
      ));
    }

  }

  void onJoinButtonPressed(BuildContext context, Mode mode) {
    String meetingId = _meetingIdController.text;
    var re = RegExp("\\w{4}\\-\\w{4}\\-\\w{4}");
    if (meetingId.isNotEmpty && re.hasMatch(meetingId)) {
      _meetingIdController.clear();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ILSScreen(
            meetingId: meetingId,
            token: token,
            mode: mode,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter valid meeting id"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Live Stream'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Creating a new meeting
            ElevatedButton(
              onPressed: () => onCreateButtonPressed(context),
              child: const Text('Instant Meeting'),
            ),
            const SizedBox(height: 40),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter LiveStream Id',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.white),
              ),
              controller: _meetingIdController,
            ),
            SizedBox(height: 10),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: 'Enter Product Name (What You are selling)',
                border: OutlineInputBorder(),
                hintStyle: TextStyle(color: Colors.white),
              ),
              controller: _meetingNameController,
            ),
            SizedBox(height: 10),
            //Joining the meeting as host
            ElevatedButton(
              onPressed: () => onJoinButtonPressed(context, Mode.CONFERENCE),
              child: const Text('Host Meeting '),
            ),
            //Joining the meeting as viewer
            ElevatedButton(
              onPressed: () => onJoinButtonPressed(context, Mode.VIEWER),
              child: const Text('Join Meeting as Viewer'),
            ),
          ],
        ),
      ),
    );
  }
}

void bumpStreamer(String newId, String Prod) async {
  /////////////////////////////////////////////////////////////
    {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('Streamers').get();
      String value="";
      if (snapshot.exists) {
        value=snapshot.value.toString();
      } else {
        print('No data available.');
      }
      //.............................................
      if(value==""){
        value = newId;
      }
      else{
        value = "$newId,$value";
      }
      //.............................................
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('Streamers');
      databaseReference.set(value).then((value) {
        print('String stored successfully!');
      }).catchError((error) {
        print('Failed to store string: $error');
      });
      writeFile(newId, "remover_1.txt");
    }
    ////////////////////////////////////////////////////////////
    {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('Products').get();
      String value="";
      if (snapshot.exists) {
        value=snapshot.value.toString();
      } else {
        print('No data available.');
      }
      //.............................................
      if(value==""){
        value = Prod;
      }
      else{
        value = "$Prod,$value";
      }
      //.............................................
      DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child('Products');
      databaseReference.set(value).then((value) {
        print('String stored successfully!');
      }).catchError((error) {
        print('Failed to store string: $error');
      });
      writeFile(Prod, "remover_2.txt");
    }
}

void writeFile(String dat, String fil_n){

    String string = dat;
    String filename = fil_n;
    String path = Directory.systemTemp.path + "/.my_files";
    Directory directory = Directory(path);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }
    File file = File(path + "/" + filename);
    file.writeAsString(string);
}

String readFile(String fil_n){

  String filename = fil_n;
  String path = Directory.systemTemp.path + "/.my_files" + "/" + filename;
  File file = File(path);
  String string = file.readAsStringSync();
  return string;

}
