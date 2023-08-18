import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pin_app/helpers/theme_services.dart';


Future<bool> getStoragePermission() async {
  var status = await Permission.manageExternalStorage.request();
  if (status == PermissionStatus.permanentlyDenied) {
    openAppSettings();
  }
  return status.isGranted;
}

Color get getThemeBlack => ThemeService.isSavedDarkMode() ? Colors.white : Colors.black;

Color get getThemeWhite => ThemeService.isSavedDarkMode() ? Colors.black : Colors.white;