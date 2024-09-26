import 'dart:convert';
import 'dart:math';

import 'package:mkbhd_clone/shared/app_constants.dart';
import 'package:http/http.dart' as http;

class MKBHDApiService {
  //Get Wallpapers
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
        var list =
            data.values.where((subproperty) => subproperty is Map && subproperty['dhd'] != null).map((subproperty) => subproperty['dhd'] as String).toList();
        list.shuffle(Random(654321));
        return list;
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
