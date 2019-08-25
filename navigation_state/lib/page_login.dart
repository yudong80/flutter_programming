import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'state_login_demo.dart';
import 'state_simple.dart';

class LoginPage extends StatelessWidget {

  void _onLogin(BuildContext context) {
    final SimpleState state = Provider.of<SimpleState>(context);
    state.setEmail("email>>>>");

    Navigator.pushNamed(context, MAIN_PAGE);
  }

  void _onCancel() =>  exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
          child:Column(
            children: <Widget>[
              Hero(
                  tag: 'heoro',
                  child: CircleAvatar(
                    child: Image.asset('assets/logo.jpg'),
                    backgroundColor: Colors.transparent,
                    radius: 58.0, //unit: logical pixel?
                  )
              ),
              SizedBox(height: 45.0),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                initialValue: 'your_name@gmail.com',
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                initialValue: 'input password',
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Log In'),
                    onPressed: () => _onLogin(context) ,
                  ),
                  SizedBox(width: 10.0),
                  RaisedButton(
                    child: Text('Cancel'),
                    onPressed: _onCancel ,
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}

