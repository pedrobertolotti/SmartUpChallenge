import 'package:flutter/material.dart';
import 'package:app/bottomNavigationButtons.dart';
import 'package:app/passwordPage.dart';
import 'navigation_bar_login.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'database.dart';
import 'createAccount.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late DataBase handler;

  Future<List<Users>> printUsers() async {
    List<Users> users = await handler.retrieveUsers();
    for (var user in users) {
      print('Username: ${user.username}');
    }
    return users;
  }

  Future<bool> checkUsernameExists(String username) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'users'),
    );
    final result =
        await db.query('users', where: 'username = ?', whereArgs: [username]);
    db.close();
    return result.isNotEmpty;
  }

  void showUserList(BuildContext context) async {
    List<Users> users = await handler.retrieveUsers();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('User List'),
          content: SingleChildScrollView(
            child: Column(
              children: users.map((user) {
                return Text(
                    'Username: ${user.username}, Password: ${user.name}');
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    handler = DataBase();
    handler.initializedDB().whenComplete(() {
      setState(() {});
    });
  }

  String username = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarLogin(),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "To get started, first enter your phone, email, or @username",
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
          Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: TextField(
                onChanged: (value) => setState(() {
                  //cada vez que cambia se lo asigna a mi variable de estado creada arriba
                  username = value;
                }),
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  hintText: "Phone, email, or username",
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
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                      child: SizedBox(
                        height: 30,
                        width: 150,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            "Show users",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 102, 175, 235),
                            ),
                          ),
                          onPressed: () {
                            showUserList(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.0, bottom: 20.0),
                      child: SizedBox(
                        height: 30,
                        width: 75,
                        child: FloatingActionButton(
                          backgroundColor: Color.fromARGB(255, 54, 184, 220),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            // chequeo que exista el usuario para poder entrar
                            // checkUsernameExists(username).then((exists) {
                            // if (exists) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
