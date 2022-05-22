import 'package:flutter/material.dart';

OutlineInputBorder myinputborder() {
  //return type is OutlineInputBorder
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ));
}

OutlineInputBorder myfocusborder() {
  return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 0.5,
      ));
}
