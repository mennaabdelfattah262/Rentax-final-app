import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              fit: BoxFit.fill,
              image:  NetworkImage("https://wallpaperaccess.com/hd-car"))),
      child: Stack(children: const <Widget>[
        Positioned(
            bottom: 12.0,
            left: 10.0,
            child: Text("Renta",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 75.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
              textAlign: TextAlign.center,)),

      ]));
}