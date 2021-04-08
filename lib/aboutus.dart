import 'package:flutter/material.dart';

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50.0,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Text("We are a happy family of"),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Text("Learn to drive",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Text("for providing the service to the customer to learn to drive cars "),
                  // Learn to drive for providing you the service about learn to drive cars :)"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("🚗",style: TextStyle(fontSize: 200.0),),
              ),//car icon
            ],
          ),
        ),
      ),
    );
  }
}
