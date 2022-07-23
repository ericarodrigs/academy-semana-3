import 'package:flutter/material.dart';
import 'package:raro_buddy_group_4/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raro Buddy Group 4',
      home: HomePage(),
    );
  }
}
