import 'package:estructura_practica_1/home/login.dart';
import 'package:estructura_practica_1/utils/colors.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/home.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: colorDarkBlue,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      color: colorWhite,
                      child: TextField(
                        obscureText: false,
                        cursorColor: colorWhite,
                        style: TextStyle(color: colorWhite),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          labelText: NOMBRE_FIELD,
                          focusColor: colorWhite,
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: colorWhite,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      color: colorWhite,
                      child: TextField(
                        obscureText: false,
                        cursorColor: colorWhite,
                        style: TextStyle(color: colorWhite),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: EMAIL_FIELD,
                          focusColor: colorWhite,
                          labelStyle: TextStyle(color: Colors.black),
                          fillColor: colorWhite,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextField(
                      obscureText: true,
                      cursorColor: colorWhite,
                      style: TextStyle(color: colorWhite),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: PASSWORD_FIELD,
                        focusColor: colorWhite,
                        labelStyle: TextStyle(color: colorWhite),
                        fillColor: colorWhite,
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
                              if (_checkbox) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Home(
                                        title: APP_TITLE,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            child: Text(
                              REGISTER_APP,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            color: colorDrakGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckboxListTile(
                    value: _checkbox,
                    title: Text(
                      "ACEPTO TERMINOS Y CONDICIONES",
                      style: TextStyle(
                        color: colorWhite,
                      ),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (bool value) {
                      _checkbox = (_checkbox) ? false : true;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return LoginView();
                      }));
                    },
                    child: Column(
                      children: [
                        Text(
                          "Ya tienes una cuenta?",
                          style: TextStyle(color: colorWhite),
                        ),
                        Text(
                          INGRESS_APP,
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
      ),
    );
  }
}
