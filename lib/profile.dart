import 'package:car1_drivers/regestration/models/state.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  StateModel appState;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    final w_fl = appState?.user?.w_fl ?? '';


    appState = StateWidget.of(context).state;
    //final userId = appState?.firebaseUserAuth?.uid ?? '';
    final number = appState?.user?.number ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: StreamBuilder(
              //future: getPosts(),
              stream: Firestore.instance
                  .collection('driver2')
                  .document(w_fl)
                  .collection("1").document(number)
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Loading ..."),
                  );
                }
                else {
                  return Card(
                    child: ListTile(
                      title: Column(
                        children: <Widget>[
                          SizedBox(height: 20),

                          Container(
                            width: 150,
                            height: 150,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(snapshot
                                        .data.data["driverImage"]))),
                          ),
                          SizedBox(height: 20),

                          Container(
                            width: 150,
                            height: 150,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new NetworkImage(snapshot
                                        .data.data["carImage"]))),
                          ),
                          SizedBox(height: 20.0,),

                          Text(
                              "Name:  ${snapshot.data.data["driverName"]}"),
                          SizedBox(height: 20.0,),
                          Text("Working location :  $w_fl"),
                          SizedBox(height: 20.0,),
                          Text("Account no. :  ${snapshot.data.data["dAccountno."]}"),
                          SizedBox(height: 20),
                          Text(
                              "IFSC :  ${snapshot.data.data["dIfsc"]}"),
                          SizedBox(height: 20),
                          Text("Holder's name :  ${snapshot.data.data["dHoldername"]}"),
                          SizedBox(height: 20),
                          Text(
                              "Gender:  ${snapshot.data.data["gender"]}"),
                          SizedBox(height: 20),
                          Text(
                              "Experience:  ${snapshot.data.data["experience"]}"),
                          SizedBox(height: 20),
                          Text(
                              "Number:  ${snapshot.data.data["driverNumber"]}"),
                          SizedBox(height: 30),
                          Text(
                            "Your working Time :",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${snapshot.data.data["time"]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text("**N/A means not available at that time")
                        ],
                      ),
                    ),
                  );
                }
              }),
        ),
      ),
    );
  }
}