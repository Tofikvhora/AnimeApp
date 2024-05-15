import 'package:anime/Constant/Themes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiProvider extends ChangeNotifier {
  List _ApiData = [];
  String _endPoint = 'https://api.jikan.moe/v4/anime?q=';
  List get apiData => _ApiData;
  bool isLoading = false;
  Future<void> fetchData(String nameOfAnime, BuildContext context) async {
    isLoading = true;
    try {
      final response = await Dio().get(_endPoint + nameOfAnime.toString());
      if (response.statusCode == 200) {
        final data = response.data;
        _ApiData = data['data'];
        isLoading = false;
        notifyListeners();
      } else if (response.statusCode == 404) {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            '404 Data not found',
          ),
          backgroundColor: DarkThemesOfApp.secondaryColor,
        ));
        notifyListeners();
      } else if (response.statusCode == 500) {
        isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text(
            '500 Internal Server error',
          ),
          backgroundColor: DarkThemesOfApp.secondaryColor,
        ));
        notifyListeners();
      }
    } on DioException catch (e) {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.message.toString(),
        ),
        backgroundColor: DarkThemesOfApp.secondaryColor,
      ));
      notifyListeners();
    }

    notifyListeners();
  }
}
