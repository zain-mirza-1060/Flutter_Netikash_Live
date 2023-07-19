import 'dart:core';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:videosdk/videosdk.dart';



import '../participant_tile.dart';
import 'meeting_controls.dart';

class ILSSpeakerView extends StatefulWidget {
  final Room room;
  const ILSSpeakerView({super.key, required this.room});

  @override
  State<ILSSpeakerView> createState() => _ILSSpeakerViewState();
}

class _ILSSpeakerViewState extends State<ILSSpeakerView> {
  var micEnabled = true;
  var camEnabled = true;
  String hlsState = "HLS_STOPPED";
  bool Flag = Decide();

  Map<String, Participant> participants = {};


  @override
  void initState() {
    super.initState();
    //Setting up the event listeners and initializing the participants and hls state
    setMeetingEventListener();
    participants.putIfAbsent(
        widget.room.localParticipant.id, () => widget.room.localParticipant);
    //filtering the CONFERENCE participants to be shown in the grid
    widget.room.participants.values.forEach((participant) {
      if (participant.mode == Mode.CONFERENCE) {
        participants.putIfAbsent(participant.id, () => participant);
      }
    });
    hlsState = widget.room.hlsState;
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    widget.room.id,
                    style: const TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                onPressed: () => {
                  Clipboard.setData(ClipboardData(text: widget.room.id)),
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Meeting Id Coppied"),
                  ))
                },
                child: const Text("Copy Meeting Id"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => {leaveMeet(context),widget.room.leave(),},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text("Leave"),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //Showing the current HLS state
          Text(
            "Current HLS State: ${hlsState == "HLS_STARTED" || hlsState == "HLS_PLAYABLE" ? "Livestream is Started" : hlsState == "HLS_STARTING" ? "Livestream is starting" : hlsState == "HLS_STOPPING" ? "Livestream is stopping" : "Livestream is stopped"}",
            style: const TextStyle(color: Colors.white),
          ),
          //render all participants in the room
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemBuilder: (context, index) {
                return ParticipantTile(
                    participant: participants.values.elementAt(index));
              },
              itemCount: participants.length,
            ),
          ),
          //Rending the meeting Controls
          MeetingControls(
            hlsState: hlsState,
            onToggleMicButtonPressed: () {
              micEnabled ? widget.room.muteMic() : widget.room.unmuteMic();
              micEnabled = !micEnabled;
            },
            onToggleCameraButtonPressed: () {
              camEnabled ? widget.room.disableCam() : widget.room.enableCam();
              camEnabled = !camEnabled;
            },
            //HLS handler which will start and stop HLS
            onHLSButtonPressed: () => {
              if (hlsState == "HLS_STOPPED")
                {
                  if(Flag==true){
                    widget.room.startHls(config: {
                      "layout": {
                        "type": "SPOTLIGHT",
                        "priority": "PIN",
                        "GRID": 20,
                      },
                      "mode": "video-and-audio",
                      "theme": "DARK",
                      "quality": "high",
                      "orientation": "portrait",
                    })
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("You are not host"),
                    ))
                  }
                }
              else if (hlsState == "HLS_STARTED" || hlsState == "HLS_PLAYABLE"){
                if(Flag==true){
                  widget.room.stopHls()
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("You are not host"),
                  ))
                }
              }
            },
          ),
        ],
      ),
    );
  }

  // listening to room events for participants join, left and hls state changes
  void setMeetingEventListener() {
    widget.room.on(
      Events.participantJoined,
          (Participant participant) {
        //Adding only Conference participant to show in grid
        if (participant.mode == Mode.CONFERENCE) {
          setState(
                () => participants.putIfAbsent(participant.id, () => participant),
          );
        }
      },
    );

    widget.room.on(Events.participantLeft, (String participantId) {
      if (participants.containsKey(participantId)) {
        setState(
              () => participants.remove(participantId),
        );
      }
    });
    widget.room.on(
      Events.hlsStateChanged,
          (Map<String, dynamic> data) {
        setState(
              () => hlsState = data['status'],
        );
      },
    );
  }
}

  void leaveMeet(BuildContext context) {
      String ID = readFile("remover_1.txt");
      String PD = readFile("remover_2.txt");
      String UN = readFile("remover_3.txt");
      writeFile("", "remover_1.txt");
      writeFile("", "remover_2.txt");
      writeFile("", "remover_3.txt");

      dumpStreamer(ID, PD, UN);
  }

  String readFile(String fil_n){

    String filename = fil_n;
    String path = Directory.systemTemp.path + "/.my_files" + "/" + filename;
    File file = File(path);
    String string = file.readAsStringSync();
    return string;

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

  void dumpStreamer(String ID, String PD, String UN) async {
    {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child("Streamers").get();
      String value = "";
      if (snapshot.exists) {
        value = snapshot.value.toString();
      }
      value = value.replaceAll("$ID,", "");
      writeFirebase(value, "Streamers");
    }
    //////////////////////////////////////////////////////

     {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child("Products").get();
      String value = "";
      if (snapshot.exists) {
        value = snapshot.value.toString();
      }
      value = value.replaceAll("$PD,", "");
      writeFirebase(value, "Products");
    }
    //////////////////////////////////////////////////////
     {
      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child("Users").get();
      String value = "";
      if (snapshot.exists) {
        value = snapshot.value.toString();
      }
      value = value.replaceAll("$UN,", "");
      writeFirebase(value, "Users");
    }
  }

  void writeFirebase(String node, String value){
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref().child(value);
    databaseReference.set(node).then((node) {
      print('String stored successfully!');
    }).catchError((error) {
      print('Failed to store string: $error');
    });
  }

  bool Decide(){
    String ID = readFile("decide.txt");
    if(ID=="1"){
      return false;
    }
    else{
      return true;
    }
  }