import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:car1_drivers/regestration/models/state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'regestration/util/state_widget.dart';
import 'regestration/models/state.dart';

class selectTime extends StatefulWidget {
  @override
  _selectTimeState createState() => _selectTimeState();
}

class _selectTimeState extends State<selectTime> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  int _myTaskType,
      _myTaskType2,
      _myTaskType3,
      _myTaskType4,
      _myTaskType5,
      _myTaskType6,
      _myTaskType7,
      _myTaskType8,
      _myTaskType9,
      _myTaskType10,
      _myTaskType11,
      _myTaskType12,
      _myTaskType13,
      _myTaskType14,
      _myTaskType15;

  String taskVal,
      taskVal2,
      taskVal3,
      taskVal4,
      taskVal5,
      taskVal6,
      taskVal7,
      taskVal8,
      taskVal9,
      taskVal10,
      taskVal11,
      taskVal12,
      taskVal13,
      taskVal14,
      taskVal15;

  StateModel appState;
  bool _loadingVisible = false;
  var selectedCurrency, selectedType;
  final GlobalKey<FormState> _formKeyValue = new GlobalKey<FormState>();
  List<String> _accountType = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '> 10',
  ];


  createData() {
    appState = StateWidget.of(context).state;
    //final userId = appState?.firebaseUserAuth?.uid ?? '';
    final number = appState?.user?.number ?? '';
    final gender = appState?.user?.gender ?? '';
    final w_fl = appState?.user?.w_fl ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final lastName = appState?.user?.lastName ?? '';

    List<String> selectedReportList1 = [
      taskVal,
      taskVal2,
      taskVal3,
      taskVal4,
      taskVal5,
      taskVal6,
      taskVal7,
      taskVal8,
      taskVal9,
      taskVal10,
      taskVal11,
      taskVal12,
      taskVal13,
      taskVal14,
      taskVal15
    ];

    DocumentReference ds = Firestore.instance
        .collection(
            'driver2') // driver details uploading to firebase to be fetched on customer side
        .document(w_fl)
        .collection("1")
        .document(number);
    Map<String, dynamic> tasks = {
      "driverName": firstName + " $lastName",
      "driverNumber": number,
      "time": selectedReportList1,
      "gender": gender,
      "time0":"empty",
      "time1":"empty",
      "time2":"empty",
      "time3":"empty",
      "time4":"empty",
      "time5":"empty",
      "time6":"empty",
      "time7":"empty",
      "time8":"empty",
      "time9":"empty",
      "time10":"empty",
      "time11":"empty",
      "time12":"empty",
      "time13":"empty",
      "time14":"empty",
    };
    ds.updateData(tasks).whenComplete(() {
      print('Task created');
    });
  }

  radio1() {
    appState = StateWidget.of(context).state;
    //final userId = appState?.firebaseUserAuth?.uid ?? '';
    final number = appState?.user?.number ?? '';
    final w_fl = appState?.user?.w_fl ?? '';

    DocumentReference ds = Firestore.instance
        .collection(
        'driver2') // driver details uploading to firebase to be fetched on customer side
        .document(w_fl)
        .collection("1")
        .document(number);

    ds.delete().whenComplete(() {
      print('Task created');
    });
    Navigator.pop(context);
  }

  void _showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure, you are not availble for the upcoming time?"),
          content: new Text(
              'To start again later, please fill your "personal details" section again...'),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                radio1();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleTask(int value) {
    setState(() {
      _myTaskType = value;

      switch (_myTaskType) {
        case 0:
          taskVal = '06:00 - 06:45 AM';
          break;
        case 1:
          taskVal = 'N/A';
          break;
      }
    });
  }

  void _handleTask2(int value) {
    setState(() {
      _myTaskType2 = value;

      switch (_myTaskType2) {
        case 0:
          taskVal2 = '07:00 - 07:45 AM';
          break;
        case 1:
          taskVal2 = 'N/A';
          break;
      }
    });
  }

  void _handleTask3(int value) {
    setState(() {
      _myTaskType3 = value;

      switch (_myTaskType3) {
        case 0:
          taskVal3 = '08:00 - 08:45 AM';
          break;
        case 1:
          taskVal3 = 'N/A';
          break;
      }
    });
  }

  void _handleTask4(int value) {
    setState(() {
      _myTaskType4 = value;

      switch (_myTaskType4) {
        case 0:
          taskVal4 = '09:00 - 09:45 AM';
          break;
        case 1:
          taskVal4 = 'N/A';
          break;
      }
    });
  }

  void _handleTask5(int value) {
    setState(() {
      _myTaskType5 = value;

      switch (_myTaskType5) {
        case 0:
          taskVal5 = '10:00 - 10:45 AM';
          break;
        case 1:
          taskVal5 = 'N/A';
          break;
      }
    });
  }

  void _handleTask6(int value) {
    setState(() {
      _myTaskType6 = value;

      switch (_myTaskType6) {
        case 0:
          taskVal6 = '11:00 - 11:45 AM';
          break;
        case 1:
          taskVal6 = 'N/A';
          break;
      }
    });
  }

  void _handleTask7(int value) {
    setState(() {
      _myTaskType7 = value;

      switch (_myTaskType7) {
        case 0:
          taskVal7 = '12:00 - 12:45 PM';
          break;
        case 1:
          taskVal7 = 'N/A';
          break;
      }
    });
  }

  void _handleTask8(int value) {
    setState(() {
      _myTaskType8 = value;

      switch (_myTaskType8) {
        case 0:
          taskVal8 = '01:00 - 01:45 PM';
          break;
        case 1:
          taskVal8 = 'N/A';
          break;
      }
    });
  }

  void _handleTask9(int value) {
    setState(() {
      _myTaskType9 = value;

      switch (_myTaskType9) {
        case 0:
          taskVal9 = '02:00 - 02:45 PM';
          break;
        case 1:
          taskVal9 = 'N/A';
          break;
      }
    });
  }

  void _handleTask10(int value) {
    setState(() {
      _myTaskType10 = value;

      switch (_myTaskType10) {
        case 0:
          taskVal10 = '03:00 - 03:45 PM';
          break;
        case 1:
          taskVal10 = 'N/A';
          break;
      }
    });
  }

  void _handleTask11(int value) {
    setState(() {
      _myTaskType11 = value;

      switch (_myTaskType11) {
        case 0:
          taskVal11 = '04:00 - 04:45 PM';
          break;
        case 1:
          taskVal11 = 'N/A';
          break;
      }
    });
  }

  void _handleTask12(int value) {
    setState(() {
      _myTaskType12 = value;

      switch (_myTaskType12) {
        case 0:
          taskVal12 = '05:00 - 05:45 PM';
          break;
        case 1:
          taskVal12 = 'N/A';
          break;
      }
    });
  }

  void _handleTask13(int value) {
    setState(() {
      _myTaskType13 = value;

      switch (_myTaskType13) {
        case 0:
          taskVal13 = '06:00 - 06:45 PM';
          break;
        case 1:
          taskVal13 = 'N/A';
          break;
      }
    });
  }

  void _handleTask14(int value) {
    setState(() {
      _myTaskType14 = value;

      switch (_myTaskType14) {
        case 0:
          taskVal14 = '07:00 - 07:45 PM';
          break;
        case 1:
          taskVal14 = 'N/A';
          break;
      }
    });
  }

  void _handleTask15(int value) {
    setState(() {
      _myTaskType15 = value;

      switch (_myTaskType15) {
        case 0:
          taskVal15 = '08:00 - 08:45 PM';
          break;
        case 1:
          taskVal15 = 'N/A';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Timings...'),
      ),
      body: Form(
        key: _formKey ,
        child: SingleChildScrollView(
          child: isLoading ? CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue)): Column(
            children: <Widget>[
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("6:00 - 6:45 AM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType,
                              onChanged: _handleTask),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType,
                              onChanged: _handleTask),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("7:00 - 7:45 AM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType2,
                              onChanged: _handleTask2),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType2,
                              onChanged: _handleTask2),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("8:00 - 8:45 AM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType3,
                              onChanged: _handleTask3),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType3,
                              onChanged: _handleTask3),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("9:00 - 9:45 AM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType4,
                              onChanged: _handleTask4),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType4,
                              onChanged: _handleTask4),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("10:00 - 10:45 AM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType5,
                              onChanged: _handleTask5),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType5,
                              onChanged: _handleTask5),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("11:00 - 11:45 AM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType6,
                              onChanged: _handleTask6),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType6,
                              onChanged: _handleTask6),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("12:00 - 12:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType7,
                              onChanged: _handleTask7),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType7,
                              onChanged: _handleTask7),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("1:00 - 1:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType8,
                              onChanged: _handleTask8),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType8,
                              onChanged: _handleTask8),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("2:00 - 2:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType9,
                              onChanged: _handleTask9),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType9,
                              onChanged: _handleTask9),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("3:00 - 3:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType10,
                              onChanged: _handleTask10),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType10,
                              onChanged: _handleTask10),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("4:00 - 4:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType11,
                              onChanged: _handleTask11),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType11,
                              onChanged: _handleTask11),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("5:00-5:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType12,
                              onChanged: _handleTask12),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType12,
                              onChanged: _handleTask12),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("6:00-6:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType13,
                              onChanged: _handleTask13),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType13,
                              onChanged: _handleTask13),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("7:00-7:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType14,
                              onChanged: _handleTask14),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType14,
                              onChanged: _handleTask14),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Container(
                  child: Column(children: <Widget>[
                Card(
                  elevation: 14,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                          child: Text(
                        "Sunday to Monday",
                      )),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("8:00-8:45 PM :"),
                      )),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: _myTaskType15,
                              onChanged: _handleTask15),
                          Text("Yes"),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 1,
                              groupValue: _myTaskType15,
                              onChanged: _handleTask15),
                          Text("No "),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        radio();
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        _showDialog1();

                      },
                      child: Text(
                        "Not available at all",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  Future radio() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      if (_myTaskType != null &&
      _myTaskType2 != null &&
      _myTaskType3 != null &&
      _myTaskType4 != null &&
      _myTaskType5 != null &&
      _myTaskType6 != null &&
      _myTaskType7 != null &&
      _myTaskType8 != null &&
      _myTaskType9 != null &&
      _myTaskType10 != null &&
      _myTaskType11 != null &&
      _myTaskType12 != null &&
      _myTaskType13 != null &&
      _myTaskType14 != null &&
      _myTaskType15 != null)  {
        _formKey.currentState.reset();
        setState(() => isLoading = false);
        createData();
        Navigator.pop(context);

        Fluttertoast.showToast(msg: 'Updated successfully');
      } else {
        setState(() => isLoading = false);
        Fluttertoast.showToast(msg: 'Select choice');
      }
    }
  }
}
