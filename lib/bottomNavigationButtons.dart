import 'package:flutter/material.dart';
import 'package:app/TwitterHome.dart';
import 'package:app/passwordPage.dart';

// lo mejor que puedo hacer es hacer un bottom navigation bar
//Tendria que usar bottom navigation bar en vez de llamar muchas veces a estos botones
Widget buttonEntrar(BuildContext context, String buttonText) {
  return SizedBox(
    height: 30,
    width: 75,
    child: FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 54, 184, 220),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => PasswordPage())),
        )
      },
    ),
  );
}

Widget buttonPassword(BuildContext context) {
  return SizedBox(
    height: 30,
    width: 150,
    child: FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        "Forgot password?",
        style: TextStyle(
          color: const Color.fromARGB(255, 102, 175, 235),
        ),
      ),
      onPressed: () {
        showDialog(
          // es un pop up en la pantalla.
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Forgot your password?'),
              content: Text('We sent an email to change the password '),
              actions: [
                TextButton(
                  child: Text('Please check your email'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    ),
  );
}

Widget buttonAHome(BuildContext context, String buttonText) {
  return SizedBox(
    height: 30,
    width: 75,
    child: FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 54, 184, 220),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => TwitterHome())),
        )
      },
    ),
  );
}
