import 'package:anime/Constant/Themes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DarkAndLight extends ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;
  void darkAndLightFunction() {
    _isDark = !_isDark;
    notifyListeners();
  }

  Future<void> urlLaunch(String url, BuildContext context) async {
    try {
      if (!await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      )) {}
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Url not found'),
        backgroundColor: DarkThemesOfApp.secondaryColor,
      ));
      notifyListeners();
    }

    notifyListeners();
  }
}
