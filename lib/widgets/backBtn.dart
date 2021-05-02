import 'package:flutter/material.dart';

class BackBTn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Navigator.of(context).pop(),
        splashColor: Color(0xff04364f),
        tooltip: 'Back Button',
        iconSize: MediaQuery.of(context).size.height * 0.04,
      ),
    );
  }
}
