import 'package:flutter/material.dart';
import 'package:app/bottomNavigationButtons.dart';
import 'navigation_bar_login.dart';
import 'login.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: NavigationBarLogin(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Enter your password",
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
                obscureText: _obscureText,
                style: TextStyle(
                  color: Colors.grey,
                ),
                decoration: InputDecoration(
                  hintText: "Password",
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
          Container(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _obscureText =
                      !_obscureText; //Al apretar cambio este estado que uso para el hide letras y tambien para ver que pongo en el text del boton
                });
              },
              child: Text(
                _obscureText ? "Show password" : "Hide password",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.end, //Para que quede abajo del todo
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 20.0, bottom: 20.0),
                      child: buttonPassword(context),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 20.0, bottom: 20.0),
                      child: buttonAHome(context, "Log In"),
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
