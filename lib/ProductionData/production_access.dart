import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:zone_rv_dashboard/models/van/check.dart';

import '../models/van/van.dart';


class ProductionAccess{
  static const String baseUrl = "zonervtrelloboard.azurewebsites.net";

  static Future<Check?> GetCheck(String id) async{
    var uri = Uri.https(baseUrl, "api/checks/$id");

    final response = await http.get(uri);

    if(response.statusCode == 200){
        print("$response.body");
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        return Check.fromJson(jsonResponse);
      } else{
      print("request failed $response.statusCode");
      return null;
    }
  }

  static Future<Van?> GetVanByName(String name) async{
    var uri = Uri.https(baseUrl, "api/boards/byname/$name");

    final response = await http.get(uri);

    if(response.statusCode == 200){
      print("$response.body");
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return Van.fromJson(jsonResponse);
    } else{
      print("request failed $response.statusCode");
      return null;
    }
  }
}