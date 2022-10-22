import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String link) async {
  Uri url = Uri.parse(link);
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw 'Could not launch $url';
  }
}
