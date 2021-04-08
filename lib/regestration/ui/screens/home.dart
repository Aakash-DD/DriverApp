import 'package:car1_drivers/availablepage.dart';
import 'package:car1_drivers/payments.dart';
import 'package:flutter/material.dart';
import 'package:car1_drivers/regestration/models/state.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:car1_drivers/regestration/ui/screens/sign_in.dart';
import 'package:car1_drivers/regestration/ui/widgets/loading.dart';

import '../../../aboutus.dart';
import '../../../confirmedBooking.dart';
import '../../../personalDetails.dart';
import '../../../profile.dart';
import '../../../settings.dart';
import '../../../support.dart';
import '../../../waitingBooking.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StateModel appState;
  bool _loadingVisible = false;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    appState = StateWidget.of(context).state;
    if (!appState.isLoading &&
        (appState.firebaseUserAuth == null ||
            appState.user == null ||
            appState.settings == null)) {
      return SignInScreen();
    } else {
      if (appState.isLoading) {
        _loadingVisible = true;
      } else {
        _loadingVisible = false;
      }

      final email = appState?.firebaseUserAuth?.email ?? '';
      final firstName = appState?.user?.firstName ?? '';

//check for null https://stackoverflow.com/questions/49775261/check-null-in-ternary-operation
      return Scaffold(
        appBar: AppBar(
          title: Text("deepbrothers"),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: Text(firstName),
                accountEmail: Text(email),
                currentAccountPicture: new CircleAvatar(
                  child: Text(
                    "dB",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0),
                  ),
                  backgroundColor: Colors.black,
                ),
                otherAccountsPictures: <Widget>[
                  new CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text("dB",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new personalDetails()),
                  );
                },
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                title: Text("Enter your personal details"),
              ),
              Divider(),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new profile()),
                  );
                },
                leading: Icon(
                  Icons.person,
                  color: Colors.lightBlue,
                ),
                title: Text("Profile"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new selectTime()),
                  );
                },
                leading: Icon(
                  Icons.work,
                  color: Colors.lightBlue,
                ),
                title: Text("Update work time"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new waitingBookings()),
                  );
                },
                leading: Icon(
                  Icons.access_time,
                  color: Colors.lightBlue,
                ),
                title: Text("Waiting bookings"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new confirmedBooking()),
                  );
                },
                leading: Icon(
                  Icons.check,
                  color: Colors.lightBlue,
                ),
                title: Text("Confirmed bookings"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new payments()),
                  );
                },
                leading: Icon(
                  Icons.attach_money,
                  color: Colors.lightBlue,
                ),
                title: Text("Payments"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new settings1()),
                  );
                },
                leading: Icon(
                  Icons.settings,
                  color: Colors.lightBlue,
                ),
                title: Text("Settings"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new support()),
                  );
                },
                leading: Icon(
                  Icons.headset_mic,
                  color: Colors.lightBlue,
                ),
                title: Text("Support"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new aboutus()),
                  );
                },
                leading: Icon(
                  Icons.info,
                  color: Colors.lightBlue,
                ),
                title: Text("About Us"),
              ),
              new ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: Icon(Icons.close,
                  color: Colors.black,),
                title: Text("Close"),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: LoadingScreen(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "deepbrothers",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                            fontSize: 32.0),
                      ),
                      //logo, // add logo
                      SizedBox(
                        height: 20.0,
                      ),
                      Text("Welcome !"),
                      Text(
                        firstName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      SizedBox(height: 48.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => new selectTime()));
                            },
                            child: Text(
                              "Update work time",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            onPressed: () {
//                          buttonClick();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => new waitingBookings()));
                            },
                            child: Text(
                              "Waiting bookings",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            inAsyncCall: _loadingVisible),
      );
    }
  }
}
