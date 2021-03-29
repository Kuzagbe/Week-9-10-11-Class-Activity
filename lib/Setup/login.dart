import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_authentication/Pages/home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                  colors: [Color(0xFF84FFFF),Color(0xFF18FFFF),
            Color(0xFF00E5FF),Color(0xFF00B8D4),
                  ],
                stops: [0.1, 0.4, 0.7, 0.9],
          )
          ),
        child: Form(
          //TODO: implement key
          key: _formkey,
          child: Column(
            children: <Widget>[
              //TODO: implement fields
              TextFormField(
                validator: (input) {
                  if(input.isEmpty){
                    return 'Email section is empty\\';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              TextFormField(
                validator: (input) {
                  if(input.length < 8){
                    return 'Your password is below 10 characters';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                obscureText: true,
              ),
              ElevatedButton(
                  onPressed: signIn,
                child: Text('Sign in'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async{
    //TODO validate fields
    final formState = _formkey.currentState;
    if(formState.validate()){
      //TODO login firebase
      formState.save();
      try{
        final User user = (await FirebaseAuth.
        instance.signInWithEmailAndPassword(email: _email, password: _password))
        .user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
        //TODO: Navigation to home
      }catch(e){
        print(e.message);
      }

    }
  }
}