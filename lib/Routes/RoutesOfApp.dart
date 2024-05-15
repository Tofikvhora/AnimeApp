import 'package:anime/View/Details_Page.dart';
import 'package:anime/View/Home_Page.dart';
import 'package:flutter/material.dart';

class RoutesOfApp {
  static MaterialPageRoute genRoutes(settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case DetailsPage.route:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DetailsPage(
                data: settings.arguments['data'],
                images: settings.arguments['images'],
                name: settings.arguments['name']));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                appBar: AppBar(
                    title: const Text(
                      "Error",
                    ),
                    centerTitle: true)));
    }
  }
}
