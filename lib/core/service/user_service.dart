// import 'package:dio/dio.dart';
// import 'package:fadvance/core/models/user_model_movie.dart';


// class UserService {
//   Dio dio = Dio();

 
//   Future<List<Welcome>> getWelcome() async {
//     String url = "https://dummyapi.online/api/movies"; 
//     Response response = await dio.get(url);

//     if (response.statusCode == 200) {
//       var json = response.data;
//       if (json is Map && json.containsKey('data')) {
//         var data = json['data'];
//         if (data is List) {
//           return data.map<Welcome>((w) => Welcome.fromJson(w)).toList();
//         }
//       }
//     }
//     return [];
//   }

//   Future<List<Welcome>> getWelcomeWithPage(String page) async {
//     String url = "https://dummyapi.online/api/movies"; 
//     Response response = await dio.get(url);

//     if (response.statusCode == 200) {
//       var json = response.data;
//       if (json is Map && json.containsKey('data')) {
//         var data = json['data'];
//         if (data is List) {
//           return data.map<Welcome>((w) => Welcome.fromJson(w)).toList();
//         }
//       }
//     }
//     return [];
//   }
// }

import 'package:dio/dio.dart';
import 'package:fadvance/core/models/user_model_movie.dart';

class UserService {
  Dio dio = Dio();

  Future<List<Welcome>> getWelcome() async {
    String url = "https://dummyapi.online/api/movies"; 
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      var json = response.data;
      if (json is List) {  
        return json.map<Welcome>((w) => Welcome.fromJson(w)).toList();
      }
    }
    return [];
  }


  Future<List<Welcome>> getWelcomeWithPage(String page) async {
    String url = "https://dummyapi.online/api/movies"; 
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      var json = response.data;
      if (json is List) {  
        return json.map<Welcome>((w) => Welcome.fromJson(w)).toList();
      }
    }
    return [];
  }
}
