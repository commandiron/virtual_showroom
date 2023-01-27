import 'package:url_launcher/url_launcher.dart';

void openURL(String url) => launchUrl(
  Uri.parse(url),
);
