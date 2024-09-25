import 'dart:convert';

import 'package:mkbhd_clone/shared/app_constants.dart';
import 'package:http/http.dart' as http;

class MKBHDApiService {
  //Get Categories
  Future<List<String>> getWallpapers() async {
    try {
      //Make API call
      var response = await http.get(Uri.parse(AppConstants.API_URL));

      if (response.statusCode != 200) {
        //Throw error if no successful response is recieved
        throw Exception('Failed to load data');
      } else {
        var jsonData = json.decode(response.body);
        var data = jsonData['data'] as Map<String, dynamic>;
        return data.values.where((subproperty) => subproperty is Map && subproperty['dhd'] != null).map((subproperty) => subproperty['dhd'] as String).toList();
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
