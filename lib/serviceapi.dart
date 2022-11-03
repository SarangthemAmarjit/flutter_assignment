import 'dart:convert';
import 'dart:developer';
import 'package:fluttertask/modalhelper.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<List<Itemmodal>?> Getdata() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final data = jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      var users = data.map((e) => Itemmodal.fromJson(e)).toList();
      log('Successfully get Data');
      return users;
    } else {
      log('Failed to Getdata.');
    }
  }
}
