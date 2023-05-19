import 'package:flutter/material.dart';
import 'package:app/frontPageLogin.dart';

class NavigationBarLogin extends StatelessWidget
    implements PreferredSizeWidget {
  const NavigationBarLogin({Key? key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      title: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            color: Color.fromARGB(255, 53, 141, 235),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FrontPageLogin()),
              );
            },
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 110.0), // Ajusta el valor según tus necesidades
            child: Container(
              height: 50,
              width: 50,
              child: Image.network(
                "https://cdn.cms-twdigitalassets.com/content/dam/help-twitter/twitter_logo_blue.png.twimg.768.png",
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
