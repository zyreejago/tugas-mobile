import 'package:fadvance/core/models/user_model_movie.dart';
import 'package:fadvance/core/service/user_service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  final UserService userService = UserService();

  List<Welcome> _welcomeList = [];
  List<Welcome> get welcomeList => _welcomeList;
  
  bool isLoading = false;

  Future<void> getWelcome(String page) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await userService.getWelcomeWithPage(page);
      _welcomeList = response;
    } catch (e) {
      // Tangani kesalahan jika ada
      // ignore: avoid_print
      print('Error fetching movies: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
