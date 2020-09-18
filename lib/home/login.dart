import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/register.dart';
import 'package:estructura_practica_1/home/home.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/utils/colors.dart';

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorDarkBlue,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    "images/cupping.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    color: colorWhite,
                    child: TextField(
                      obscureText: false,
                      style: TextStyle(color: colorWhite),
                      cursorColor: colorWhite,
                      decoration: InputDecoration(
                        labelText: NOMBRE_FIELD,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2)),
                        fillColor: colorWhite,
                        focusColor: colorWhite,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    color: colorWhite,
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(color: colorWhite),
                      cursorColor: colorWhite,
                      decoration: InputDecoration(
                        labelText: PASSWORD_FIELD,
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2)),
                        fillColor: colorWhite,
                        focusColor: colorWhite,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        height: 60,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home(
                                    title: APP_TITLE,
                                  );
                                },
                              ),
                            );
                          },
                          child: Text(INGRESS_APP),
                          color: colorDrakGray,
                          focusColor: colorDrakGray,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  FORGOT_PASSWORD,
                  style: TextStyle(color: colorWhite),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterView();
                        },
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Text(
                        "¿Aún no tienes cuenta?",
                        style: TextStyle(color: colorWhite),
                      ),
                      Text(
                        REGISTER_APP,
                        style: TextStyle(color: colorWhite),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
