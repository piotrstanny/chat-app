import 'package:flutter/material.dart';

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type a message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kSendersMessage = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    bottomLeft: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0));

const kReceiversMessage = BorderRadius.only(
    topRight: Radius.circular(25.0),
    bottomLeft: Radius.circular(25.0),
    bottomRight: Radius.circular(25.0));
