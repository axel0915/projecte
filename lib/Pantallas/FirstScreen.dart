import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/home_screen.png"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100),
                  Text(
                    "TITOL APLICACIÓ MÒBIL",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 400),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Registra't", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[900],
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        shape: StadiumBorder()),
                  ),
                  SizedBox(height: 20),
                  Text("Ja tens un compte?",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Inicia sessió", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey,
                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        shape: StadiumBorder()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}