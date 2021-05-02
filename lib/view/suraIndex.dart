import 'package:flutter/material.dart';
import 'package:moshaf/widgets/flare.dart';

import '../widgets/title.dart';
import '../widgets/backBtn.dart';
import '../widgets/customImagePos.dart';
import '../animations/BUTTONANIMATION.dart';
import '../widgets/loadingShimmer.dart';
import '../controller/API.dart';

class SuraIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder(
              future: API().getAllSurah(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return LoadingShimmer(
                    text: 'SURAH',
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Center(
                    child: Text("No Internet"),
                  );
                } else if (snapshot.hasData == null) {
                  return Center(
                    child: Text("Oops ! SOme Thing went wrong"),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Check YOUR COntection"),
                  );
                } else if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Color(0xffee8f8b),
                          height: 2.0,
                        );
                      },
                      itemCount: snapshot.data.surahs.length,
                      itemBuilder: (context, index) {
                        return WIDGETBUTTONANIMATION(
                          ListTile(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) => SurahInfo(
                                  surahNumber:
                                      snapshot.data.surahs[index].number,
                                  arabicName:
                                      "${snapshot.data.surahs[index].name}",
                                  englishName:
                                      "${snapshot.data.surahs[index].englishName}",
                                  ayahs:
                                      snapshot.data.surahs[index].ayahs.length,
                                  revelationType:
                                      "${snapshot.data.surahs[index].revelationType}",
                                  englishNameTranslation:
                                      "${snapshot.data.surahs[index].englishNameTranslation}",
                                ),
                              );
                            },
                            leading: Text(
                              '${snapshot.data.surahs[index].number}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            title: Text(
                              snapshot.data.surahs[index].englishName,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            subtitle: Text(
                              snapshot
                                  .data.surahs[index].englishNameTranslation,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            trailing: Text(
                              snapshot.data.surhahs[index].name,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text("UNEXPECTED ERROR"),
                  );
                }
              },
            ),
            CustomImage(
              height: height * 0.17,
              opacity: 0.3,
              networkImageUrl: 'https://i.ibb.co/WvWbc7Y/kaaba.png',
            ),
            BackBTn(),
            MyTitle(
              title: 'SURAH INDEX',
            ),
            Flare(
              color: Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -50,
              flareDuration: Duration(seconds: 17),
              left: 100,
              height: 60,
              width: 60,
            ),
            Flare(
              color: Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -50,
              flareDuration: Duration(seconds: 12),
              left: 10,
              height: 25,
              width: 25,
            ),
            Flare(
              color: Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -40,
              left: -100,
              flareDuration: Duration(seconds: 18),
              height: 50,
              width: 50,
            ),
            Flare(
              color: Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -50,
              left: -80,
              flareDuration: Duration(seconds: 15),
              height: 50,
              width: 50,
            ),
            Flare(
              color: Color(0xfff9e9b8),
              offset: Offset(width, -height),
              bottom: -20,
              left: -120,
              flareDuration: Duration(seconds: 12),
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class SurahInfo extends StatefulWidget {
  final int surahNumber;
  final String arabicName;
  final String englishName;
  final String englishNameTranslation;
  final int ayahs;
  final String revelationType;

  const SurahInfo({
    this.surahNumber,
    this.arabicName,
    this.englishName,
    this.englishNameTranslation,
    this.ayahs,
    this.revelationType,
  });
  @override
  _SurahInfoState createState() => _SurahInfoState();
}

class _SurahInfoState extends State<SurahInfo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ScaleTransition(
      scale: scaleAnimation,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
            height: height * 0.37,
            width: width * 0.75,
            decoration: ShapeDecoration(
              color: Colors.grey[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'SURAH INFO',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: height * 0.2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.englishName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Text(
                      widget.arabicName,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                Text("Ayahs: ${widget.ayahs}"),
                Text("Surah Number: ${widget.surahNumber}"),
                Text("Chapter: ${widget.revelationType}"),
                Text("Meaning: ${widget.englishNameTranslation}"),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.05,
                  child: FlatButton(
                      color: Color(0xffee8f8b),
                      onPressed: () => Navigator.pop(context),
                      child: Text("OK")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
