import 'package:flutter/material.dart';
import 'package:flutter_learning/home.dart';

class MyLoginPage extends StatelessWidget{
  static const routeName = '/login';
  final String uname = "user";
  final String password = "login123";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Login Page"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: const Text(
                    "Chat App",
                    style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: const Text(
                      "Sign in",
                      style: TextStyle(fontSize: 20),
                    )
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username'
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: true,
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password'
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                      style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.red)),
                      onPressed: () {
                        Navigator.of(context).pushNamed(MyHomePage.routeName);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red
                        ),
                      )
                  ),
                )
              ]
          )
      )
      );
  }
}