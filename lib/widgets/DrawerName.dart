import 'package:flutter/material.dart';

class DrawerName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\nThe',
              style: TextStyle(
                fontSize: height * 0.025,
                color: Colors.grey[200],
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'MOSHAF\n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: height * 0.035,
                color: Colors.grey[200],
              ),
            ),
          ],
        ),
        Image.asset(
          'assets/grad_logo.png',
          height: height * 0.17,
        ),
      ],
    );
  }
}
