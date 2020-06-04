import 'package:flutter/material.dart';

class TextFieldShadow extends StatelessWidget {
  
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Color cursorColor;
  final EdgeInsets margin;

  const TextFieldShadow({
    Key key, 
    @required this.hintText, 
    @required this.title, 
    this.controller,
    this.cursorColor, 
    this.margin
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: margin,
      child: Column(
        children: <Widget>[
          _Title(this.title),
          _TextFieldShadow(
            hintText: this.hintText,
            cursorColor: this.cursorColor,
            controller: this.controller,
          ),
        ],
      ),
    );
  }
}

class _TextFieldShadow extends StatelessWidget {
  
  final String hintText;
  final TextEditingController controller;
  final Color cursorColor;

  const _TextFieldShadow({
    this.hintText, 
    this.controller, 
    this.cursorColor
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: screenSize.height*0.055,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width*0.15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 0),
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2
          )
        ]
      ),
      child: TextField(
        controller: this.controller,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: screenSize.height*0.018,
          fontWeight: FontWeight.bold
        ),
        keyboardType: TextInputType.number,
        cursorColor: this.cursorColor,
        decoration: InputDecoration(
          hintText: this.hintText,
          hintStyle: TextStyle(
            fontSize: screenSize.height*0.018,
            fontWeight: FontWeight.normal
          ),
          border: InputBorder.none
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;

  _Title(this.title);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: screenSize.height*0.02),
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: screenSize.height*0.025
        ),
      ),
    );
  }
}