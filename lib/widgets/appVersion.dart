import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'MOSHAF',
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.018),
          ),
          Text(
            'Version 1.0.0\n',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.015,
            ),
          ),
        ],
      ),
    );
  }
}
