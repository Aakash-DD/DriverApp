import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:car1_drivers/regestration/models/state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'regestration/util/state_widget.dart';

import 'regestration/models/state.dart';

class personalDetails extends StatefulWidget {
  @override
  _personalDetailsState createState() => _personalDetailsState();
}

class _personalDetailsState extends State<personalDetails> {
  String taskname1;
  String taskname2;
  String taskname3;
  String taskname4;
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

  File _image1, _image2,_image3, _image4;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

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

  void uploadProduct({
    String productName,
    String images,images2,images3,images4,
  }) {
    appState = StateWidget.of(context).state;
    final number = appState?.user?.number ?? '';
    final firstName = appState?.user?.firstName ?? '';
    final w_fl = appState?.user?.w_fl ?? '';
    final gender = appState?.user?.gender ?? '';
    //final w_fl = appState?.user?.w_fl ?? '';
    //final firstName = appState?.user?.firstName ?? '';
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

    Firestore.instance
        .collection('driver2')
        .document(w_fl)
        .collection("1")
        .document(number)
        .setData({
      'carImage': images2,
      'driverImage': images,
      'dLicense': images3,
      'dPanCard': images4,
      "experience": selectedType + " years",
      "driverName": firstName + " $lastName",
      "driverNumber": number,
      "time": selectedReportList1,
      "gender": gender,
      "dAddress":taskname1,
      "dAccountno.":taskname2,
      "dIfsc":taskname3,
      "dHoldername":taskname4,
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
    });
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
  getTaskName1(tasknameU) {
    this.taskname1 = tasknameU;
  }
  getTaskName2(tasknameU) {
    this.taskname2 = tasknameU;
  }
  getTaskName3(tasknameU) {
    this.taskname3 = tasknameU;
  }
  getTaskName4(tasknameU) {
    this.taskname4 = tasknameU;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fill your details :'),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isLoading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.blue,),) : Column(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            decoration:
                            InputDecoration(labelText: 'Enter your Bank Account no.'),
                            onChanged: (String name) {
                              getTaskName2(name);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            decoration:
                            InputDecoration(labelText: 'Enter IFSC code'),
                            onChanged: (String name) {
                              getTaskName3(name);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                            decoration:
                            InputDecoration(labelText: "Bank Holder's name"),
                            onChanged: (String name) {
                              getTaskName4(name);
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.male,
                              size: 25.0,
                              color: Color(0xff11b719),
                            ),
                            DropdownButton(
                              items: _accountType
                                  .map((value) => DropdownMenuItem(
                                        child: Text(
                                          value,
                                          style:
                                              TextStyle(color: Color(0xff11b719)),
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
                                'Choose your experience of driving',
                                style: TextStyle(color: Color(0xff11b719)),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Card(
                          elevation: 15,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Your photo"),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OutlineButton(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(1),
                                            width: 2.5),
                                        onPressed: () {
                                          _selectImage(
                                              ImagePicker.pickImage(
                                                  source: ImageSource.gallery),
                                              1);
                                        },
                                        child: _displayChild1()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Upload car photo :"),
                              Text("Front photo of car"),
                              Column(
                                children: <Widget>[
                                  Text("1. "),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.grey.withOpacity(1),
                                              width: 2.5),
                                          onPressed: () {
                                            _selectImage(
                                                ImagePicker.pickImage(
                                                    source: ImageSource.gallery),
                                                2);
                                          },
                                          child: _displayChild2()),
                                    ),
                                  ),
                                  Card(
                                    elevation: 15,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Driver's license"),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: OutlineButton(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey.withOpacity(1),
                                                      width: 2.5),
                                                  onPressed: () {
                                                    _selectImage(
                                                        ImagePicker.pickImage(
                                                            source: ImageSource.gallery),
                                                        3);
                                                  },
                                                  child: _displayChild3()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 15,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text("Pan Card"),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: OutlineButton(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey.withOpacity(1),
                                                      width: 2.5),
                                                  onPressed: () {
                                                    _selectImage(
                                                        ImagePicker.pickImage(
                                                            source: ImageSource.gallery),
                                                        4);
                                                  },
                                                  child: _displayChild4()),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration:
                    InputDecoration(labelText: 'Enter your sector or area name eg. sector 11/area name'),
                    onChanged: (String name) {
                      getTaskName1(name);
                    },
                  ),
                ),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          // createData();
                          validateAndUpload();
                          //radio();
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
      case 4:
        setState(() => _image4 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey.withOpacity(1),
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey.withOpacity(1),
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey.withOpacity(1),
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild4() {
    if (_image4 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: Colors.grey.withOpacity(1),
        ),
      );
    } else {
      return Image.file(
        _image4,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Future validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);

      if (taskname1!=null &&
          taskname2!=null &&
          taskname3!=null &&
          taskname4!=null &&
          selectedType !=null &&
          _image1 != null &&
          _image2 != null &&
          _image3 != null &&
          _image4 != null &&
          _myTaskType != null &&
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
          _myTaskType15 != null) {
        String imageUrl1;
        String imageUrl2;
        String imageUrl3;
        String imageUrl4;
        //  String imageUrl3;
        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture1 = "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task1 = storage.ref().child(picture1).putFile(_image1);
        final String picture2 = "2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task2 = storage.ref().child(picture2).putFile(_image2);
        final String picture3 = "3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task3 = storage.ref().child(picture3).putFile(_image3);
        final String picture4 = "4${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task4 = storage.ref().child(picture4).putFile(_image4);


        StorageTaskSnapshot snapshot1 =
            await task1.onComplete.then((sanapshot) => sanapshot);
        StorageTaskSnapshot snapshot2 =
            await task2.onComplete.then((sanapshot) => sanapshot);
        StorageTaskSnapshot snapshot3 =
        await task3.onComplete.then((sanapshot) => sanapshot);


        task4.onComplete.then((snapshot4) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          imageUrl2 = await snapshot2.ref.getDownloadURL();
          imageUrl3 = await snapshot3.ref.getDownloadURL();
          imageUrl4 = await snapshot4.ref.getDownloadURL();

          uploadProduct(
            images: imageUrl1,
            images2: imageUrl2,
            images3: imageUrl3,
            images4: imageUrl4,
          );

         // _formKey.currentState.reset();
          setState(() => isLoading = false);
          Fluttertoast.showToast(msg: 'Account completed successfully');
          Navigator.pop(context);
        });
      } else {
        setState(() => isLoading = false);
        Fluttertoast.showToast(msg: 'All the details must be provided !');
      }
    }
  }
}
