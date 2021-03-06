import 'package:flutter/material.dart';
import 'package:launch_review/launch_review.dart';
import 'package:moshaf/widgets/appVersion.dart';
import 'package:moshaf/widgets/backBtn.dart';
import 'package:moshaf/widgets/title.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/SharedIcon.dart';

class ShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            BackBTn(),
            MyTitle(
              title: 'Share App',
            ),
            ShareInfo()
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.13),
          Image.asset('assets/grad_logo.png', height: height * 0.2),
          SizedBox(height: height * 0.02),
          Text(
              "The Holy Qur'an App is also available as Open Source on GitHub!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption),
          SizedBox(height: height * 0.05),
          GitHubRepoBtn(),
          ShareAppBtn(),
          RateFeedBackBtn(),
          SizedBox(height: height * 0.02),
          AppVersion()
        ],
      ),
    );
  }
}

class GitHubRepoBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: FlatButton(
            padding: EdgeInsets.all(5.0),
            color: Colors.grey[700],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  ShareIcon.github,
                  size: MediaQuery.of(context).size.height * 0.03,
                ),
                Text("  GitHub Repo")
              ],
            ),
            onPressed: () => launch("https://github.com/MohamedFaraag/moshf")),
      ),
    );
  }
}

class ShareAppBtn extends StatefulWidget {
  @override
  _ShareAppBtnState createState() => _ShareAppBtnState();
}

class _ShareAppBtnState extends State<ShareAppBtn> {
  String text = "Download the latest MOSHAF App on Play store\n\n"
      "https://play.google.com/store/apps/details?id=com.farag.moshaf \n\nShare More! It is Sadaq-e-Jaria :)";

  void share(BuildContext context) {
    final RenderBox box = context.findRenderObject();

    Share.share(text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: FlatButton(
            padding: EdgeInsets.all(5.0),
            color: Color(0xffee8f8b),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.share,
                  size: MediaQuery.of(context).size.height * 0.03,
                ),
                Text("  Share App")
              ],
            ),
            onPressed: () => share(context)),
      ),
    );
  }
}

class RateFeedBackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: FlatButton(
            padding: EdgeInsets.all(5.0),
            color: Color(0xff689f38),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  ShareIcon.google_play,
                  size: MediaQuery.of(context).size.height * 0.025,
                ),
                Text("  Rate & Feedback")
              ],
            ),
            onPressed: () =>
                LaunchReview.launch(androidAppId: "com.farag.moshaf")),
      ),
    );
  }
}
