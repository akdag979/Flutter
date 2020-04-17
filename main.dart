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
                     appBar: AppBar(title: Text('Hello Flutter', style: TextStyle(fontSize: 30.0),), backgroundColor: Colors.red),
                     body: Center(child: Text('Hello Budy',style: TextStyle(color: Colors.red,fontSize: 35.0)),)
      ),
    );
  }
}
