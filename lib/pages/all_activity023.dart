import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  late DatabaseReference _databaseRef;
  List<Map<dynamic, dynamic>> notifications = [];
  bool hasData = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) {
      _databaseRef = FirebaseDatabase.instance.reference().child('notifications');
      _databaseRef.once().then((DataSnapshot snapshot) {
        if (snapshot.value != null) {
          setState(() {
            notifications = List<Map<dynamic, dynamic>>.from(snapshot.value as List<dynamic>);
            hasData = true;
          });
        } else {
          setState(() {
            hasData = false;
          });
        }
      } as FutureOr Function(Object value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Activity'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> Checker()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (hasData)
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationCard(
                    name: 'John Doe',
                    content: notification['notification_content'],
                    time: notification['time'],
                    onDelete: () async {
                      await _databaseRef.child(notification['serial_number']).remove();
                      setState(() {
                        notifications.removeAt(index);
                      });
                    },
                  );
                },
              ),
            if (!hasData)
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(16),
                color: Colors.grey[300],
                child: Text(
                  'No New Notifications',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String name;
  final String content;
  final String time;
  final VoidCallback onDelete;

  const NotificationCard({
    required this.name,
    required this.content,
    required this.time,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (20 == 20) {
          // Add your logic here
        }
      },
      onHorizontalDragEnd: (_) {
        // Add your logic here
      },
      child: Stack(
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  time,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: onDelete,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
