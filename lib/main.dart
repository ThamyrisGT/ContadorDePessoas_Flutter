// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _infoText="Pode entrar";

  void _changePessoas(int delta) {
    setState(() {
      _pessoas += delta;
      if(_pessoas<0){
      _infoText="Mundo Invertido?";
      }
      else if(_pessoas <=10){
       _infoText="Pode Entrar !";
      }else{  _infoText="Lotado !";}
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/restaurant.jpg',
          fit: BoxFit.cover,
          height: 10000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Text(
              "Pessoas: $_pessoas",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // ignore: deprecated_member_use
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePessoas(1);
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                      onPressed: () {
                        _changePessoas(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      )),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ],
    );
  }
}
