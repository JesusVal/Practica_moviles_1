import 'package:estructura_practica_1/home/home_login.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';
import 'package:estructura_practica_1/home/home.dart';

class SplashView extends StatefulWidget {
  SplashView({Key key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<bool> _waitingForAWhile() async {
    await Future.delayed(
        Duration(
          seconds: 4,
        ),
        () {});
    return true;
  }

  @override
  void initState() {
    super.initState();

    _waitingForAWhile().then((status) {
      if (status) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => HomeLogin(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "images/coffee.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Container(
                  height: 180,
                  width: 180,
                  child: Image.asset(
                    "images/cupping.png",
                    fit: BoxFit.fitWidth,
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
