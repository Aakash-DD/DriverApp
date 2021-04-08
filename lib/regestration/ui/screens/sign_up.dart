import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/services.dart';

import 'package:car1_drivers/regestration/models/user.dart';
import 'package:car1_drivers/regestration/util/auth.dart';
import 'package:car1_drivers/regestration/util/validator.dart';
import 'package:car1_drivers/regestration/ui/widgets/loading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstName = new TextEditingController();
  final TextEditingController _lastName = new TextEditingController();
  final TextEditingController _number = new TextEditingController();
  final TextEditingController _location = new TextEditingController();
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  bool _autoValidate = false;
  bool _loadingVisible = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _accountType = <String>[
    'Male',
    'Female',
  ];

  Widget build(BuildContext context) {

    final firstName = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _firstName,
      validator: Validator.validateName,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final lastName = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _lastName,
      validator: Validator.validateName,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.person,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final number = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _number,
      validator: Validator.validateNumber,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.phone,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Phone number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final location = TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      controller: _location,
      validator: Validator.validateName,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.location_on,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Location',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      controller: _email,
      validator: Validator.validateEmail,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.email,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: _password,
      validator: Validator.validatePassword,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 5.0),
          child: Icon(
            Icons.lock,
            color: Colors.grey,
          ), // icon is 48px widget.
        ), // icon is 48px widget.
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          check();
        },
        padding: EdgeInsets.all(12),
        color: Theme.of(context).primaryColor,
        child: Text('SIGN UP', style: TextStyle(color: Colors.white)),
      ),
    );

    final signInLabel = FlatButton(
      child: Text(
        'Have an Account? Sign In.',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        Navigator.pushNamed(context, '/signin');
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingScreen(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                     // logo,
                      Padding(
                        padding: const EdgeInsets.only(top:50),
                        child: Center(
                          child: Text(
                            "deepbrothers",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontSize: 32.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 48.0),
                      firstName,
                      SizedBox(height: 24.0),
                      lastName,
                      SizedBox(height: 24.0),
                      number,
                      SizedBox(height: 24.0),
                      location,
                      SizedBox(height: 24.0),
                      email,
                      SizedBox(height: 24.0),
                      password,
                      SizedBox(height: 12.0),

                      Form(
                        key: _formKeyValue,
                        autovalidate: true,
                        child: new Column(
//                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          children: <Widget>[
                            SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    FontAwesomeIcons.male,
                                    size: 25.0,
                                    color: Color(0xff11b719),
                                  ),
                                  SizedBox(width: 50.0),
                                  DropdownButton(
                                    items: _accountType
                                        .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Color(0xff11b719)),
                                      ),
                                      value: value,
                                    ))
                                        .toList(),
                                    onChanged: (selectedAccountType) {
                                      print('$selectedAccountType');
                                      setState(() {
                                        selectedType = selectedAccountType;
                                      });
                                    },
                                    value: selectedType,
                                    isExpanded: false,
                                    hint: Text(
                                      'Choose your gender',
                                      style: TextStyle(color: Color(0xff11b719)),
                                    ),
                                  )
                                ],
                              ),
                            SizedBox(height: 40.0),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Choose your area, where you will be working"),
                            ),
                            StreamBuilder<QuerySnapshot>(
                                stream: Firestore.instance.collection("driver1").snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData)
                                    const Text("Loading.....");
                                  else {
                                    List<DropdownMenuItem> currencyItems = [];
                                    for (int i = 0; i < snapshot.data.documents.length; i++) {
                                      DocumentSnapshot snap = snapshot.data.documents[i];
                                      currencyItems.add(
                                        DropdownMenuItem(
                                          child: Text(
                                            snap.documentID,
                                            style: TextStyle(color: Color(0xff11b719)),
                                          ),
                                          value: "${snap.documentID}",
                                        ),
                                      );
                                    }
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(FontAwesomeIcons.searchLocation,
                                            size: 25.0, color: Color(0xff11b719)),
                                        SizedBox(width: 50.0),
                                        DropdownButton(
                                          items: currencyItems,
                                          onChanged: (currencyValue) {
                                            final snackBar = SnackBar(
                                              content: Text(
                                                'Selected Area is $currencyValue',
                                                style: TextStyle(color: Color(0xff11b719)),
                                              ),
                                            );
                                            Scaffold.of(context).showSnackBar(snackBar);
                                            setState(() {
                                              selectedCurrency = currencyValue;
                                            });
                                          },
                                          value: selectedCurrency,
                                          isExpanded: false,
                                          hint: new Text(
                                            "Choose your location",
                                            style: TextStyle(color: Color(0xff11b719)),
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                }),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Choose carefully",style: TextStyle(color: Colors.red),),
                            )

                          ],
                        ),
                      ),
                      signUpButton,
                      signInLabel,
                    ],
                  ),
                ),
              ),
            ),
          ),
          inAsyncCall: _loadingVisible),
    );
  }

  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loadingVisible = !_loadingVisible;
    });
  }

  void _emailSignUp(
      {String firstName,
        String lastName,
        String number,
        String location,
        String email,
        String password,
        String gender,
        // String fl,
        String w_fl,
        BuildContext context, }) async {
    if (_formKey.currentState.validate()) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        await _changeLoadingVisible();
        //need await so it has chance to go through error if found.
        await Auth.signUp(email, password).then((uID) {
          Auth.addUserSettingsDB(new User(
              userId: uID,
              email: email,
              firstName: firstName,
              lastName: lastName,
              number: number,
              location: location,
              // fl:fl,
              w_fl:w_fl,
            gender: gender,
          ));
        });
        await Navigator.pushNamed(context, '/signin');
      } catch (e) {
        _changeLoadingVisible();
        print("Sign Up Error: $e");
        String exception = Auth.getExceptionText(e);
        Flushbar(
          title: "Sign Up Error",
          message: exception,
          duration: Duration(seconds: 5),
        )..show(context);
      }
    } else {
      setState(() => _autoValidate = true);
    }
  }

  Future check() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if ( selectedType!=null && selectedCurrency!=null)  {
        // _formKey.currentState.reset();
        setState(() => isLoading = false);
        _emailSignUp(
            firstName: _firstName.text,
            lastName: _lastName.text,
            number: _number.text,
            //location: _location.text,
            //fl:taskVal.toString(),
            w_fl:selectedCurrency,
            gender:selectedType,
            email: _email.text,
            password: _password.text,
            context: context);

      } else {
        setState(() => isLoading = false);
        Fluttertoast.showToast(msg: 'Fill all the details');
      }
    }
  }

}
