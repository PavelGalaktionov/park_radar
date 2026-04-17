import 'package:permission_handler/permission_handler.dart';

// bool isProductionMode() {
//   return getIt<AppConfiguration>().isProduction;
// }
//
// bool isDevelopMode() {
//   return !isProductionMode();
// }

import 'dart:io';

void printInfo(final String label, final String info) {
    print("Park radar - " + label + ": " + info);
}

Future<bool> hasNetwork() async {
    try {
        final result = await InternetAddress.lookup('www.google.com');
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
        return false;
    }
}

Future<void> requestPermission() async {
    //await Permission.location.request();
    await Permission.locationWhenInUse.request();
}