import 'package:farmapk/helpers/get_icons.dart';
import 'package:flutter/material.dart';

class ScroollWithOutGlow extends StatelessWidget {
  const ScroollWithOutGlow({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        height: size.width < sizePre ? 250 : 570,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(child: child),
        ),
      ),
    );
  }
}
