import 'package:flutter/material.dart';
import 'package:app/bottomNavigationButtons.dart';
import 'navigation_bar_login.dart';
import 'main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';
import 'package:app/createAccount.dart';

class createAccount extends StatefulWidget {
  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {
  late DataBase handler;

  @override
  void initState() {
    super.initState();
    handler = DataBase();
  }

  Future<void> addUser() async {
    Users user = Users(username: "pedro", name: "Pedro");
    await handler.addUser(user);
    print("Se agrego pedro");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarLogin(),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Text(
                  "Create your Account",
                  style: TextStyle(
                    fontFamily: "Helvetica Neue LT",
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.25,
                    height: 1.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 40),
              TextField(
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              TextField(
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  hintText: "Date of Birth",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 30,
                  width: 75,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 54, 184, 220),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      await addUser();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Users {
  late final String username;
  late final String name;

  Users({
    required this.username,
    required this.name,
  });

  Users.fromMap(Map<String, dynamic> result)
      : username = result["username"],
        name = result["name"];

  Map<String, Object> toMap() {
    return {
      'username': username,
      'name': name,
    };
  }
}
