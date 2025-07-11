import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

String getPlatform() {
  if (kIsWeb) {
    return 'web';
  } else if (Platform.isAndroid || Platform.isIOS) {
    return 'app';
  } else {
    return 'app';
  }
}