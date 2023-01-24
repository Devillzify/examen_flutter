import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style =
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold);

  TextStyle style2 = TextStyle(
      fontSize: 25,
      color: Color.fromARGB(255, 6, 226, 255),
      fontWeight: FontWeight.bold);

  Widget build(BuildContext context) {
    TextEditingController text = TextEditingController();
    TextEditingController text2 = TextEditingController();
    text.text = Preferences.email;
    text2.text = Preferences.pass;
    final Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87, title: Text("HomePage")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (Preferences.email.length >= 5 && Preferences.pass.length >= 5) {
            if (Preferences.guardar == false) {
              setState(() {
                Preferences.email = '';
                Preferences.pass = '';
              });
            }
            Navigator.pushNamed(context, 'list');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Complete los campos anteriores para acceder")));
          }
        },
        child: Icon(Icons.send, color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://static.posters.cz/image/1300/pinturas-sobre-lienzo-suicide-squad-harley-quinn-i111222.jpg'),
                fit: BoxFit.cover)),
        width: media.width,
        height: media.height,
        child: Column(children: [
          Container(
            color: Color.fromARGB(180, 17, 0, 255),
            child: TextField(
              controller: text,
              style: style,
              decoration: InputDecoration(
                  hintText: "email@email.com",
                  hintStyle: style,
                  label: Text("Email", style: style),
                  icon: Icon(Icons.email, color: Colors.white)),
              onChanged: ((value) {
                Preferences.email = value;
              }),
            ),
          ),
          Container(
            color: Color.fromARGB(180, 17, 0, 255),
            child: TextField(
              controller: text2,
              style: style,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "******",
                  hintStyle: style,
                  label: Text("Password", style: style),
                  icon: Icon(Icons.lock, color: Colors.white)),
              onChanged: (value) {
                Preferences.pass = value;
              },
            ),
          ),
          Container(
            color: Color.fromARGB(180, 0, 0, 0),
            child: Row(children: [
              Container(
                width: media.width * 0.8,
                child: Center(
                  child: Text("Remember Password", style: style2),
                ),
              ),
              Checkbox(
                  value: Preferences.guardar, onChanged: ((value) => cambio()))
            ]),
          ),
        ]),
      ),
    );
  }

  cambio() {
    if (Preferences.guardar) {
      Preferences.guardar = false;
      Preferences.email = '';
      Preferences.pass = '';
    } else {
      Preferences.guardar = true;
    }
    setState(() {});
  }
}
