import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class LuncherHelper {
  static void launchGoogleMaps(
      {required String lat, required String long}) async {
    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    final Uri _url = Uri.parse(googleMapslocationUrl);

    if (await launchUrl(_url)) {
    } else {}
  }

  static Future<void> share(String name, String shortDescription) async {
    await FlutterShare.share(
      title: name,
      chooserTitle: shortDescription,
      text: "$name \n $shortDescription",
    );
  }
}
