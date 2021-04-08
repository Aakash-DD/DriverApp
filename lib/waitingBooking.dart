import 'package:car1_drivers/regestration/models/state.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class waitingBookings extends StatefulWidget {
  @override
  _waitingBookingsState createState() => _waitingBookingsState();
}

class _waitingBookingsState extends State<waitingBookings> {
  StateModel appState;
  bool _loadingVisible = false;
  String customerImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfARWrne-XAY8gNwa8Z2dA9ivVp6aupjP5bepsGt5C4lQP5LWneg&s";

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    final number = appState?.user?.number ?? '';

    Future getPosts() async {
      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection("customer2")
          .document(number) //testing purpose
          .collection("1")
          .getDocuments();
      return qn.documents;
    }

    navigateToDetail(DocumentSnapshot post1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => DetailPage(post: post1)));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Waiting Bookings :"),
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
                          onTap: () {
                            navigateToDetail(snapshot.data[index]);
                          },
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
                                          image: new NetworkImage(customerImage)))),
                              SizedBox(height: 10),
                              Text(
                                  "Time:  ${snapshot.data[index].data["time"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Date:  ${snapshot.data[index].data["rideOn"]}"),
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
                                  "CreatedOn:  ${snapshot.data[index].data["createdOn"]}"),
                              // date of scheduled
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

class DetailPage extends StatefulWidget {
  final DocumentSnapshot post;

  DetailPage({this.post});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool pressed = false;

  StateModel appState;
  bool _loadingVisible = false;
  final GlobalKey<ScaffoldState> mScaffoldState =
  new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    delete() {
      //to be update data which is gonna be fetched on driver side
      appState = StateWidget.of(context).state;
      //final userId = appState?.firebaseUserAuth?.uid ?? '';
      final number = appState?.user?.number ?? '';
      final firstName = appState?.user?.firstName ?? '';
      final lastName = appState?.user?.lastName ?? '';
      DocumentReference ds = Firestore.instance
          .collection(
          "customer2") // customer2 means customer details to be fetched on driver side
          .document(number)
          .collection("1")
          .document("${widget.post.data["createdOn"]}");
      ds.delete().whenComplete(() {
        print('Task delete');
      });
    }

    confirm() {
      //to be update data which is gonna be fetched on driver side
      appState = StateWidget.of(context).state;
      final number = appState?.user?.number ?? '';
      DocumentReference ds = Firestore.instance
          .collection(
          "customer2.2") // customer2 means customer details to be fetched on driver side
          .document(number)
          .collection("1")
          .document("${widget.post.data["createdOn"]}");
      Map<String, dynamic> data = {
        //"Status": firstName + " $lastName",
        "status": "Confirmed",
        "address": "${widget.post.data["address"]}",
        "customerImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfARWrne-XAY8gNwa8Z2dA9ivVp6aupjP5bepsGt5C4lQP5LWneg&s",
        "customerName": "${widget.post.data["customerName"]}",
        "customerNumber": "${widget.post.data["customerNumber"]}",
        "landmark": "${widget.post.data["landmark"]}",
        "pocket": "${widget.post.data["pocket"]}",
        "sector": "${widget.post.data["sector"]}",
        "time": "${widget.post.data["time"]}",
        "rideOn": "${widget.post.data["rideOn"]}",
        "paytoDriver":"Not Done !",
        "createdOn": "${widget.post.data["createdOn"]}",
      };
      ds.setData(data).whenComplete(() {
        print('Task confirm');
      });
    }

    confirm2() {
      //to be update data which is gonna be fetched on customer side
      appState = StateWidget.of(context).state;
      DocumentReference ds = Firestore.instance
          .collection("confirmed_c_rides2")
          .document("${widget.post.data["customerNumber"]}")
          .collection("1")
          .document("${widget.post.data["createdOn"]}");
      Map<String, dynamic> data = {
        //"Status": firstName + " $lastName",
        "status": "confirmed",
      };
      ds.updateData(data).whenComplete(() {
        print('Task confirm2');
      });
    }

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Request to cancel"),
            content: new Text(
                'Please describe your issue at "driverdb123@gmail.com" & mention your "settingsId", "registered Phone no." & "createdOn Id".Charges may apply upto RS 100'),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      key: mScaffoldState,
      appBar: AppBar(
        title: Text("Waiting bookings"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.post.data["status"]),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          delete();
                          confirm();
                          confirm2();
                          Navigator.pop(context);
                          Fluttertoast.showToast(msg: 'Confirmed !');
                        },
                        child: Text("Confirm"),
                      ),
                    ],

                  ),
                  SizedBox(height: 10.0,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          _showDialog();
                        },
                        child: Text("Request to cancel"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
