import 'package:flutter/material.dart';

Widget screenHeader() {
  return SliverAppBar(
    floating: false,
    pinned: true,
    snap: false,
    centerTitle: false,
    title: Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(width: 5),
        Text('MyOnlineDoctor'),
      ],
    )),
  );
}
