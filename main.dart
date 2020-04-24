// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {

  runApp(
      MaterialApp(
        title: "Stateful App Example",
        home: InputtoText(),
      )
  );
}

class InputtoText extends StatefulWidget {
  @override
  _InputtoTextState createState() {
    return _InputtoTextState();
  }
}

class _InputtoTextState extends State<InputtoText> {
  String userInput = "";
  
  @override
  Widget build(BuildContext context) {
    debugPrint('UserInput Widget is created');
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Sample with UserInput"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userWrote) {
                setState(() {
                  debugPrint('SetState; This calls framework to restate the UserInput Widget');
                  userInput = userWrote;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text("User wrote now $userInput", style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
