import 'package:flutter/material.dart';
import '../animations/BUTTONANIMATION.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[800],
      child: Stack(
        children: [
          AppName(),
          CallingGraphy(),
          QuranRail(),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SurahBtn(),
                  JuzzIndexBtn(),
                  SajdaIndexBtn(),
                ],
              ),
            ),
          ),
          AyaBtn(),
        ],
      ),
    );
  }
}

class AyaBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '\nIndeed, It is We who sent down the MOSHAF\n AND  We will be its Guardian\n',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            'MOSHAF',
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SajdaIndexBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.01,
      ),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, '/SajdaIndex'),
          child: WIDGETBUTTONANIMATION(Text(
            'Sajda',
            style: TextStyle(
              fontSize: height * 0.023,
              color: Color(0xffee8f8b),
              fontWeight: FontWeight.w600,
            ),
          )),
        ),
      ),
    );
  }
}

class JuzzIndexBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.01),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, '/JuzzIndex'),
          child: WIDGETBUTTONANIMATION(Text(
            'Juzz',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: height * 0.023,
              color: Color(0xffee8f8b),
            ),
          )),
        ),
      ),
    );
  }
}

class SurahBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.01,
      ),
      child: SizedBox(
        width: width * 0.7,
        height: height * 0.06,
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: () => Navigator.pushNamed(context, '/SuraIndex'),
          child: WIDGETBUTTONANIMATION(
            Text(
              'SURA INDEX',
              style: TextStyle(
                fontSize: height * 0.023,
                fontWeight: FontWeight.w600,
                color: Color(0xffee8f8b),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class QuranRail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      left: width * 0.0,
      bottom: height * 0.0,
      child: Opacity(
        opacity: 0.2,
        child: Image.asset(
          'assets/quranRail.png',
          height: height * 0.4,
        ),
      ),
    );
  }
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
        top: height * 0.17,
        left: width * 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "MOSHAF",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ));
  }
}

class CallingGraphy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      right: width * 0.01,
      top: height * 0.045,
      child: Image.asset(
        'assets/grad_logo.png',
        height: height * 0.28,
      ),
    );
  }
}
