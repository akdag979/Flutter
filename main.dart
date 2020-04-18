// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// first update pubspec.yaml as below
/*
dependencies:
flutter:
sdk: flutter

cupertino_icons: ^0.1.2
english_words: ^3.1.0   # add this line
*/
// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Flutter',
      home: Scaffold(
          appBar: AppBar(
              title: Text(
                'Hello Flutter',
                style: TextStyle(fontSize: 30.0, color: Colors.red),
              ),
              backgroundColor: Colors.orange),
          body: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 40.0),
              alignment: Alignment.center,
              color: Colors.red,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Random Word ;',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Random Number ;',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RandomWords(),
                      ),
                      Expanded(
                        child: Text(
                          'Random Number ;',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  RandomImaage(),
                  GenerateOneMore(),
                ],
              ),
            ),
          )),
    );
  }
}

/// Random English words code starts here

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    return Text(
      wordPair.asPascalCase,
      style: TextStyle(color: Colors.white, fontSize: 30.0),
    );
  }
}

/// image class is below
class RandomImaage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('lib/images/Random_Order.png');
    Image image = Image(
      image: assetImage,
      width: 250.0,
      height: 250.0,
    );
    return Container(
      child: image,
    );
  }
}

/// button goes below
class GenerateOneMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      width: 250.0,
      height: 100,
      child: RaisedButton(
        color: Colors.orange,
        child: Text(
          'Generate Random',
          style: TextStyle(fontSize: 30.0, color: Colors.white),
        ),
        elevation: 9.0,
        onPressed: () => generateRandom(context),
      ),
    );
  }
}

void generateRandom(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Generated"),
    content: Text('Hope to see you again'),
  );
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}
