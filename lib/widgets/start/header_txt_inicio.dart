// ignore_for_file: must_be_immutable

import 'package:farmapk/widgets/text_animation.dart';
import 'package:flutter/material.dart';

class HeaderTxt extends StatefulWidget {
  final String txtSmall;
  bool visible = false;

  HeaderTxt({Key? key, required this.txtSmall}) : super(key: key);

  @override
  State<HeaderTxt> createState() => _HeaderTxtState();
}

class _HeaderTxtState extends State<HeaderTxt> {
  @override
  void initState() {
    super.initState();

    _getDelay().then((value) {
      setState(() {
        widget.visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: _getDelay().then((value) {
        setState(() {
          widget.visible = true;
        });
      }),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          margin: EdgeInsets.only(top: 27, left: size.width * 0.05),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w500),
                  child: widget.visible
                      ? TextAnimation(txt: widget.txtSmall)
                      : const Text('')),
              const SizedBox(height: 9.0),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getDelay() async {
    return await Future.delayed(const Duration(milliseconds: 500));
  }
}
