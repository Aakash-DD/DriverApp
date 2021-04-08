import 'package:car1_drivers/regestration/models/state.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class payments extends StatefulWidget {
  @override
  _paymentsState createState() => _paymentsState();
}

class _paymentsState extends State<payments> {
  StateModel appState;
  bool _loadingVisible = false;

  @override
  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    final number = appState?.user?.number ?? '';

    Future getPosts() async {
      var firestore = Firestore.instance;
      QuerySnapshot qn = await firestore
          .collection("customer2.2")
          .document(number)
          .collection("1")
          .getDocuments();
      return qn.documents;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
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
                              SizedBox(height: 10),
                              Text(
                                  "createdOn:  ${snapshot.data[index].data["createdOn"]}"),
                              SizedBox(height: 10),
                              Text(
                                  "Payment status:  ${snapshot.data[index].data["paytoDriver"]}"),
                              SizedBox(height: 10),
                              Text("+ Rs 2,399.2",style: TextStyle(color: Colors.green),),
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
