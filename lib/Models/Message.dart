import 'package:flutter/material.dart';

class Message {
  final String msg;
  final String time;
  final bool seen;
  final bool received;
  final bool sent;
  final bool isMe ;
  Message(this.msg, this.time, this.seen, this.received, this.sent, this.isMe);
}

List<Message> msgs = [
  new Message("Hello", "12:56 am", false,false, true,true),
  new Message("Hello", "12:56 am", true,false, false,true),
  new Message("Hello", "12:56 am", true,false, false,true),
  new Message("Hello", "12:56 am", true,false, false,false),
  new Message("Hello", "12:56 PM", true,false, false,false),
  new Message("Hell HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloo", "12:56 am", true,false, false,true),
  new Message("Hello", "12:56 am", false,true, false,true),
  new Message("Hello", "12:56 am", true,false, false,true),
  new Message("Hello", "12:56 am", true,false, false,false),
  new Message("Hello", "12:56 am", true,false, false,true),
  new Message("Hello", "12:56 am", true,false, false,false),
  new Message("Hello", "12:56 am", true,false, false,true),
  new Message("Hello", "12:56 am", false,false, true,false),
] ;