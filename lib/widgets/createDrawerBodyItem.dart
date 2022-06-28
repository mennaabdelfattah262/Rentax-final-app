import 'package:flutter/material.dart';

Widget createDrawerBodyItem(
    {required IconData icon, required String text, required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(text,style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Colors.grey,
          ),),
        )
      ],
    ),
    onTap: onTap,
  );
}