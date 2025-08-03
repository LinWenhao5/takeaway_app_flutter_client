import 'package:url_launcher/url_launcher.dart';

Future<void> openGoogleMaps(String address) async {
  final url = Uri.encodeFull('https://www.google.com/maps/search/?api=1&query=$address');
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}

Future<void> callPhone(String phone) async {
  final url = 'tel:$phone';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}