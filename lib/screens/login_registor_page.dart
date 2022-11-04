import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfood/auth.dart';
import 'package:flutterfood/style/app_style.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage ='';
  bool isLogin = true;

  final TextEditingController _controllerEmail =TextEditingController();
  final TextEditingController _controllerPassword =TextEditingController();

  Future<void> signInWithEmailAndPassword()async{
    try{
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text,
      );
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }
  Future<void> createUserWithEmailAndPassword()async{
    try{
      await Auth().createUserWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text,
      );
    }on FirebaseAuthException catch(e){
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title(){
    return  Text('Flutterfooad',
    style: AppStyle.flutterfood);
  }
  Widget _entryField(
    String title,
    TextEditingController controller,
  ){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange))
      ),
    );
  }
    Widget _entryFieldps(
    String title,
    TextEditingController controller,
  ){
    return TextField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        labelText: title,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange))
      ),
    );
  }
  Widget _errorMessage(){
    return Text(errorMessage == ''?'': 'Humm ? $errorMessage');
  }
  Widget _sumitButton(){
    return ElevatedButton(
      onPressed: 
      isLogin? signInWithEmailAndPassword : createUserWithEmailAndPassword, 
      child: Text(isLogin ? 'Loging' : 'Register'),
      style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: MaterialStateProperty.all(Colors.orange)),
      );
  }
  Widget _loginOrRegisterButton(){
    return TextButton(onPressed: (){
      setState(() {
        isLogin = !isLogin;
      });
    }, 
    child: Text(isLogin? 'Register instead' : 'Login instead'),
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.orange),
      backgroundColor: MaterialStateProperty.all(Colors.white)
    ),
    );
    }
    Widget _box(){
      return SizedBox(height: 10,);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _title(),
            _box(),
            _entryField('email', _controllerEmail),
            _entryFieldps('password', _controllerPassword),
            _errorMessage(),
            _sumitButton(),
            _loginOrRegisterButton()

          ],
        ),
        ),
    );
  }
}