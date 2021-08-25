import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:multymccarthys/auth/auth.dart';
import 'package:multymccarthys/widgets/back_button.dart';
import 'package:multymccarthys/widgets/top_container.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:multymccarthys/pages/admin/edit_recipe.dart';
//import 'package:multymccarthys/pages/admin/view_recipe.dart';

class CommonThings {
  static Size size;
}

TextEditingController nameInputController;
String id;
final db = Firestore.instance;
String name;


class Information extends StatefulWidget {

  final String id;
  Information({this.auth, this.onSignedOut, this.id});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  @override
  _Information createState() => _Information();
}

class _Information extends State<Information>{

  //Widget content;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              width: width,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Acerca de nosotros...',
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: WebView(
                initialUrl: "https://www.facebook.com/McCarthysSanMiguel",
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
