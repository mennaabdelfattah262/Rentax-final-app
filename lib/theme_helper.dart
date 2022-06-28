import 'package:flutter/material.dart';

class ThemeHelper{
  InputDecoration textInputDecoration([String lableText="", String hintText =""]){
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.green.shade100,
      filled: true,
      prefixIcon: Icon(Icons.email_rounded),
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  InputDecoration passwordInputDecoration([String lableText="", String hintText =""]){
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.green.shade100,
      filled: true,
      prefixIcon: Icon(Icons.lock),
      suffixIcon: Icon(Icons.visibility_off),
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.black)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  BoxDecoration buttonBoxDecoration(BuildContext context, [String color1 = "", String color2 = ""]) {
    Color c1 = Colors.blueGrey.shade700;
    Color c2 = Colors.black;
    if (color1.isEmpty == false) {

    }
    if (color2.isEmpty == false) {

    }

    return BoxDecoration(
      boxShadow:  [
        BoxShadow(color: Colors.blueGrey.shade700, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: [0.0, 1.0],
        colors: [
        Colors.blueGrey.shade700,
        Colors.blueGrey.shade700,
        ],
      ),
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(


      shape: MaterialStateProperty.all<RoundedRectangleBorder>(

        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.green.shade100,),
      shadowColor: MaterialStateProperty.all(Colors.grey),
    );
  }
  inputBoxDecorationShaddow() {}

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.green.shade100,),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }





}






class LoginFormStyle{

}