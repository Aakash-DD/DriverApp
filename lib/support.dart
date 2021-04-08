import 'package:flutter/material.dart';

class support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Support"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("We will be happy to help you..."),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("Email your query to :"),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text("driverdb123@gmail.com",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text('and mention your "settingsId" & "registered Phone no."'),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("😊",style: TextStyle(fontSize: 200.0),),
              ),//car icon
            ],
          ),
        ),
      ),

    );
  }
}
