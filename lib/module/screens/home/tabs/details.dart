import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String detail;
  const Details({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        detail,
        style: const TextStyle(
          wordSpacing: 4,
          fontFamily: 'SourceSansPro',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
