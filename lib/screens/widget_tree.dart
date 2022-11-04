import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfood/auth.dart';
import 'package:flutterfood/screens/home_page.dart';
import 'package:flutterfood/screens/login_registor_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterfood/screens/home_sceen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return   HomeScreen();
        }else{
          return  LoginPage();
        }
      },
    );
  }
}