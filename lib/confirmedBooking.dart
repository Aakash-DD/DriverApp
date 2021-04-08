import 'package:car1_drivers/regestration/models/state.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class confirmedBooking extends StatefulWidget {
  @override
  _confirmedBookingState createState() => _confirmedBookingState();
}

class _confirmedBookingState extends State<confirmedBooking> {
  StateModel appState;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    //final userId = appState?.firebaseUserAuth?.uid ?? '';
    final number = appState?.user?.number ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';

    Future getPosts() async {
      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection("customer2.2")
          .document(number) //testing purpose
          .collection("1")
          .getDocuments();
      return qn.documents;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Confirm Bookings :"),
      ),
      body: Container(
        child: FutureBuilder(
            future: getPosts(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading ..."),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              "https://firebasestorage.googleapis.com/v0/b/signin-66177.appspot.com/o/customer.png?alt=media&token=dfbf81ad-20b3-4002-a906-94927fef26fb")))),
                              SizedBox(height: 10),
                              Text(
                                  "Time:  ${snapshot.data[index].data["time"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Customer Name:  ${snapshot.data[index].data["customerName"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Status:  ${snapshot.data[index].data["status"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Customer no.:  ${snapshot.data[index].data["customerNumber"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Address:  ${snapshot.data[index].data["address"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Sector:  ${snapshot.data[index].data["sector"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "landmark:  ${snapshot.data[index].data["landmark"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Pocket:  ${snapshot.data[index].data["pocket"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Scheduled on:  ${snapshot.data[index].data["rideOn"]}"),
                              Text(
                                  "createdOn:  ${snapshot.data[index].data["createdOn"]}")
                            ],
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
