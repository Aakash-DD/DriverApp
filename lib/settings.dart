import 'package:flutter/material.dart';
import 'package:car1_drivers/regestration/models/state.dart';
import 'package:car1_drivers/regestration/util/state_widget.dart';
import 'package:car1_drivers/regestration/ui/screens/sign_in.dart';
import 'package:car1_drivers/regestration/ui/widgets/loading.dart';

class settings1 extends StatefulWidget {
  _settings1State createState() => _settings1State();
}

class _settings1State extends State<settings1> {
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


      final signOutButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            StateWidget.of(context).logOutUser();
          },
          padding: EdgeInsets.all(12),
          color: Theme.of(context).primaryColor,
          child: Text('SIGN OUT', style: TextStyle(color: Colors.white)),
        ),
      );

      final forgotLabel = FlatButton(
        child: Text(
          'Forgot password?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/forgot-password');
        },
      );

      final signUpLabel = FlatButton(
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
      );

      final signInLabel = FlatButton(
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signin');
        },
      );
//check for null https://stackoverflow.com/questions/49775261/check-null-in-ternary-operation
      final userId = appState?.firebaseUserAuth?.uid ?? '';
      final email = appState?.firebaseUserAuth?.email ?? '';
      final firstName = appState?.user?.firstName ?? '';
      final lastName = appState?.user?.lastName ?? '';
      final number = appState?.user?.number ?? '';
      final settingsId = appState?.settings?.settingsId ?? '';
      final userIdLabel = Text('App Id: ');
      final emailLabel = Text('Email: ');
      final firstNameLabel = Text('First Name: ');
      final lastNameLabel = Text('Last Name: ');
      final numberLabel = Text("Number");
      final settingsIdLabel = Text('SetttingsId: ');

      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
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
                      SizedBox(height: 48.0),
                      userIdLabel,
                      Text(userId,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      emailLabel,
                      Text(email,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      firstNameLabel,
                      Text(firstName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      lastNameLabel,
                      Text(lastName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      numberLabel,
                      Text(number,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      settingsIdLabel,
                      Text(settingsId,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12.0),
                      signOutButton,
                      signInLabel,
                      signUpLabel,
                      forgotLabel
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

/*Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "Name : ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(firstname),
              Text(lastname),
            ],
          ),
          Row(
            children: [
              Text(
                "Email : ",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(email),
            ],
          ),
          Row(
            children: [
              Text(
                "Phone number : ",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(number),
            ],
          ),
          Row(
            children: [
              Text(
                "User ID : ",
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(userId),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StreamBuilder(
                  // for Q1 and q_id
                  //future: getPosts(),

                  stream: Firestore.instance
                      .collection('bidersReviewS99')
                      .document(userId)
                      .snapshots(),
                  builder: (_, snapshot1) {
                    if (snapshot1.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading ..."),
                      );
                    } else if (snapshot1.data.data["uB_Rating_total"] != 0 &&
                        snapshot1.data.data["ratersCount"] != 0) {
                      double z;

                      z = (snapshot1 // stream builder snapshot1
                              .data
                              .data["uB_Rating_total"] /
                          snapshot1.data.data["ratersCount"]);
                      return Row(
                        children: <Widget>[
                          Text("$z"),
                          Icon(
                            Icons.star,
                            color: Colors.yellowAccent,
                          ),
                        ],
                      );
                    } else {
                      return Text(
                        'No reviews',
                        style: TextStyle(color: Colors.grey),
                      );
                    }
                  }),
            ],
          ),
          RaisedButton(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => profilePage()));
            },
            child: Text("See comments"),
          )
        ],
      ),*/