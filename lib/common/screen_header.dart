import 'package:flutter/material.dart';

Widget screenHeader() {
  return  SliverAppBar(
    floating: false,
    pinned: true,
    snap: false,
    centerTitle: false,
    title: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const[
          CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://drive.google.com/uc?export=view&id=1kpnMhKnGuX_89C2RYtuaMy8jZJFte2Ad'
                ),
                radius: 10,
          ),
          SizedBox(width: 5),
          Text('myOnlineDoctor'),
        ],
      )
    ),
  );
}
