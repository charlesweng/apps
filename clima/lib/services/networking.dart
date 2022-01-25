import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final String networkUrl;

  NetworkingHelper({@required this.networkUrl});

  Future<dynamic> getData() async {
    http.Response resp = await http.get(Uri.parse(networkUrl));

    if (resp.statusCode == HttpStatus.accepted ||
        resp.statusCode == HttpStatus.ok) {
      return jsonDecode(resp.body);
    } else {
      print("Something went wrong, status code ${resp.statusCode}");
    }

    return null;
  }
}