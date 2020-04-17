// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

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
                style: TextStyle(fontSize: 30.0),
              ),
              backgroundColor: Colors.red),
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
                          'Random Name ;',
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
                        child: Text(
                          'random name',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'random number',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  RandomImage()
                ],
              ),
            ),
          )),
    );
  }
}

/// code below adds an img file under the second row which is located ./lib/images/ folder,
/// and you should update pubspec.yaml file assets section too.see
///  # https://flutter.dev/assets-and-images/#resolution-aware.
class RandomImage extends StatelessWidget {
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
