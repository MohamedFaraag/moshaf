import 'package:flutter/material.dart';

import '../widgets/appVersion.dart';
import '../widgets/DrawerName.dart';

class MyDrawer extends StatelessWidget {
  myListTitle({
    BuildContext context,
    double height,
    IconData iconTitle,
    String title,
    String pushName,
  }) {
    return Card(
      color: Colors.grey[700],
      child: ListTile(
        leading: Icon(
          iconTitle,
          size: height * 0.035,
        ),
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, pushName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: Colors.grey[800],
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DrawerName(),
              Column(
                children: [
                  myListTitle(
                    context: context,
                    title: 'Juzz Index',
                    height: height,
                    iconTitle: Icons.format_list_bulleted,
                    pushName: '/JuzzIndex',
                  ),
                  myListTitle(
                    context: context,
                    title: 'Sura Index',
                    height: height,
                    iconTitle: Icons.format_align_left,
                    pushName: '/SuraIndex',
                  ),
                  myListTitle(
                    context: context,
                    title: 'Sajda Index',
                    iconTitle: Icons.format_align_right,
                    height: height,
                    pushName: '/SajdaIndex',
                  ),
                  myListTitle(
                    context: context,
                    title: 'Help',
                    iconTitle: Icons.help,
                    height: height,
                    pushName: '/Help',
                  ),
                  myListTitle(
                    context: context,
                    title: 'Share APPLICATION',
                    iconTitle: Icons.share,
                    height: height,
                    pushName: '/ShareApp',
                  ),
                  myListTitle(
                    context: context,
                    title: 'Intro',
                    iconTitle: Icons.integration_instructions_rounded,
                    pushName: '/intro',
                    height: height,
                  ),
                  AppVersion(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
