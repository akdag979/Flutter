// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Compound Interest Calculator',
    home: CompountCalculator(),
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.redAccent,
        accentColor: Colors.lightBlueAccent),
  ));
}

class CompountCalculator extends StatefulWidget {
  @override
  _CompountCalculatorState createState() => _CompountCalculatorState();
}

class _CompountCalculatorState extends State<CompountCalculator> {
  var _currency = ['USD', 'TRY', 'GEL'];
  final double _ten = 10.0;
  final double _five = 5.0;
  var _currentItemSelected = 'empty';

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currency[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.button;
    return Scaffold(
        appBar: AppBar(
          title: Text('Compound Interest Rate Calculator'),
        ),
        body: Container(
          padding: EdgeInsets.all(_five),
          margin: EdgeInsets.all(_ten),
          //color: Colors.orange[300],
          child: ListView(
            children: <Widget>[
              oneImage(),
              Padding(
                  padding: EdgeInsets.only(top: _five),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: principalController,
                    decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal Amount',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(_five))
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: _five, bottom: _five),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: roiController,
                      decoration: InputDecoration(
                          labelText: 'Interest Rate',
                          hintText: 'Enter Interest rate in %',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(_five))
                      ),
                      )),
              Padding(
                  padding: EdgeInsets.only(top: _five, bottom: _five),
                  child: Row(children: <Widget>[
                    Expanded(child: TextField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: termController,
                      decoration: InputDecoration(
                          labelText: 'Period',
                          hintText: 'Enter Period in Years',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(_five))
                      ),

                    )),
                    Container(width: _ten,),
                    Expanded(child: DropdownButton<String>(
                      items: _currency.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentItemSelected,
                      onChanged: (String newValueSelected) {
                        _onDropDownItemSelected(newValueSelected);
                      },
                    ))
                  ],
                  )),
              Padding(
                  padding: EdgeInsets.only(top: _ten, bottom: _ten),
                  child: Row(children: <Widget>[
                    Expanded(child: RaisedButton(
                      color: Theme.of(context).appBarTheme.color,
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Calculate', textScaleFactor: 1.5,),
                      onPressed: (){
                        setState(() {
                          this.displayResult = _calculateTotalReturn();
                        });
                      },

                    )),
                    Expanded(child: RaisedButton(
                      color: Theme.of(context).appBarTheme.color,
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Reset', textScaleFactor: 1.5,),
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      }
                    ))
                  ])),
              Padding(
                padding: EdgeInsets.only(top: _five),
                child: Text(this.displayResult, textScaleFactor: 2.0,style: textStyle,),
              )
            ],
          ),
        ));
  }
//create a folder as images and add your image file. I use Random_order.png 
  Widget oneImage() {
    AssetImage oneImage = AssetImage('lib/images/Random_Order.png');
    Image image = Image(
      image: oneImage,
      width: 120.0,
      height: 120.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(10.0),
    );
  }
  void _onDropDownItemSelected(String newValueSelected) {
    setState((){
      this._currentItemSelected = newValueSelected;
    });
  }
  String _calculateTotalReturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double period = double.parse(termController.text);
    var compounding = (1 + (roi/100));
    for (var i =1; i < period; i++) {
      compounding = compounding * (1 + (roi/100));
    }

    double finalAmount = principal * compounding;
    String result = 'In $period years, you wil get $finalAmount $_currentItemSelected';
    return result;
  }
    void _reset (){
      principalController.text = '';
      roiController.text = '';
      termController.text = '';
      displayResult = '';
      _currentItemSelected = _currency[0];
    }

}
