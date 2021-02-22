///ribbon item
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCard extends InkWell {
  MyCard({
    @required String title,
    @required String abstr,
    @required String avatar,
    @required String username,
    @required String published,
    @required String updated,
    @required String url,
  }) : super(
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 8),
            padding: EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                style: BorderStyle.solid,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      margin: EdgeInsets.only(right: 8),
                      padding: (avatar != null) ? null : EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: (avatar != null)
                                ? NetworkImage(avatar)
                                : AssetImage(
                                    'lib/assets/img/Symbol-New-York-Times.png',
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                title,
                                softWrap: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                abstr,
                                softWrap: true,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                ),
                Text(
                  username,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '$published    $updated',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            launchURL(url);
          },
        );

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      print('Could not launch $url');
    }
  }
}
