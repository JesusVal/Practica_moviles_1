import 'package:estructura_practica_1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/home/register.dart';
import 'package:estructura_practica_1/home/login.dart';

class HomeLogin extends StatefulWidget {
  HomeLogin({Key key}) : super(key: key);

  @override
  _HomeLoginState createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50.0,
                      height: 60,
                      child: MaterialButton(
                        child: Text(REGISTER_APP),
                        color: colorDrakGray,
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterView();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 50.0,
                      height: 60,
                      child: MaterialButton(
                        child: Text(LOGIN_APP),
                        color: colorDrakGray,
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginView();
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
