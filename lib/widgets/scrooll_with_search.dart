import 'package:flutter/material.dart';

class SearcAndScrollJoin extends StatelessWidget {
  const SearcAndScrollJoin({Key? key, required this.children})
      : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HomePage.appBarSearch(context),
      body: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }
}
