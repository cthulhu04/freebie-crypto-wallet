import 'package:flutter/material.dart';

Widget LoginLogo() {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: NetworkImage(
          'https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
    )),
  );
}
