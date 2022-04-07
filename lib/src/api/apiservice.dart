import 'dart:convert';

import 'package:api_assignment/src/model/DataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService extends ChangeNotifier {
  Future getData() async {
    final productUrl = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(productUrl);

    // print(response.body);
    // print(response.statusCode);
    notifyListeners();

    return jsonDecode(response.body);
  }

  Future getProductData(int id) async {
    final productUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final response = await http.get(productUrl);

    // print(response.body);
    // print(response.statusCode);
    notifyListeners();

    return jsonDecode(response.body);
  }

  //Post
  Future userLogin(String username, String password) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");

    final response = await http.post(loginUrl, body: {
      "username": username,
      "password": password,
    });
    print(response.statusCode);
    print(response.body);
    return jsonDecode(response.body);
  }
}
