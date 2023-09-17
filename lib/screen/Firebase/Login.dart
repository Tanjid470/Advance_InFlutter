import 'package:advance_in_flutter/screen/Firebase/firebase_auth.dart';
import 'package:flutter/material.dart';

class Firebase extends StatefulWidget {
  const Firebase({Key? key}) : super(key: key);

  @override
  _FirebaseState createState() => _FirebaseState();
}

class _FirebaseState extends State<Firebase> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Email/Pass Auth'),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin:const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              !isLogin
                  ? TextFormField(
                      key:const ValueKey('username'),
                      decoration:const InputDecoration(hintText: "Enter Username"),
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return 'Username is so small';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          username = value!;
                        });
                      },
                    )
                  : Container(),
              TextFormField(
                key:const ValueKey('email'),
                decoration:const InputDecoration(hintText: "Enter Email"),
                validator: (value) {
                  if (!(value.toString().contains('@'))) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              TextFormField(
                obscureText: true,
                key:const ValueKey('password'),
                decoration: const InputDecoration(hintText: "Enter Password"),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return 'Password is so small';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          isLogin
                              ? signin(email, password)
                              : signup(email, password);
                        }
                      },
                      child: isLogin ? const Text('Login') :const Text('Signup'))),
             const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? const Text("Don't have an account? Signup")
                      : const Text('Already Signed Up? Login'))
            ],
          ),
        ),
      ),
    );
  }
}
