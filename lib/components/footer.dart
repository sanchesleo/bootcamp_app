import 'package:flutter/material.dart';

class FooterApp extends StatelessWidget {
  const FooterApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(33, 33, 33, 1),
      ),
      child: Text(
        'Bootcamp - PS13',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color.fromRGBO(238, 238, 238, 1), fontSize: 21),
      ),
    );
  }
}
