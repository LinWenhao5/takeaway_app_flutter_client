import 'dart:io';

import 'package:flutter/foundation.dart';
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

Future<void> openWebUrl(String url) async {
  final uri = Uri.parse(url);

  LaunchMode mode;
  if (kIsWeb) {
    mode = LaunchMode.platformDefault;
  } else if (Platform.isIOS || Platform.isAndroid) {
    mode = LaunchMode.externalApplication;
  } else {
    mode = LaunchMode.platformDefault;
  }

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: mode);
  } else {
    throw Exception('Could not launch $url');
  }
}