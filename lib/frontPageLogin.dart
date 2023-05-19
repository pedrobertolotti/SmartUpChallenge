import 'package:app/TwitterHome.dart';
import 'package:flutter/material.dart';
import 'package:app/createAccount.dart';
import 'login.dart';

class FrontPageLogin extends StatelessWidget {
  const FrontPageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(left: 20, top: 120, right: 20, bottom: 100),
              padding: EdgeInsets.all(20.0),
              child: Text(
                "See what's happening in the world right now.",
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
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Image.network(
                        "https://www.pngall.com/wp-content/uploads/5/Google-G-Logo.png",
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Espacio entre los botones
                  Container(
                    width: 200,
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10), // espacio entre los botones
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 102, 175, 235),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => createAccount()),
                          ),
                        );
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // espacio entre los botones y el texto

                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'By signing up, you agree our ',
                        ),
                        TextSpan(
                          text: 'Terms, Privacy Policy, and Cookies use.',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.only(bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                          text: 'Have an account already? ',
                        ),
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Espacio entre el botón "Log in" y el botón adicional

            // Agregar el botón "Log in anonim"
            SizedBox(
              height: 40,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => TwitterHome())),
                  );
                },
                child: Text(
                  "Log in anonim",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
