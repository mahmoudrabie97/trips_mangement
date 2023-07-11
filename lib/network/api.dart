import 'dart:async';
import 'dart:io';
import 'package:drive_app/utilites/widgets/showdialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallApi {
  static String msg = '';

  static Future<http.Response?> postData(
      {required Map data,
      required String baseUrl,
      required String apiUrl,
      required Map<String, String> headers,
      required bool st,
      required BuildContext context}) async {
    try {
      msg = '';
      var fullUrl = baseUrl + apiUrl;

      return await http.post(Uri.parse(fullUrl), body: data, headers: headers);
    } on IOException catch (e) {
      debugPrint('Socket Error: $e');
      msg = 'Socket Error: $e';
    } on Error catch (e) {
      debugPrint('General Error: $e');
      msg = 'General Error: $e';
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    } on FormatException catch (e) {
      debugPrint('Format Error: $e');
      msg = 'Format Error: $e';
    }

    if (st == true) {
      if (msg != '') {
        ShowMyDialog.showMsg(context, msg, 'error');
      }
    }
    // Add a default return statement with a value of null or throw an exception
    return null;
  }

  static Future<http.Response?> getData({
    required String baseUrl,
    required String apiUrl,
    required BuildContext context,
    required Map<String, String> headers,
  }) async {
    try {
      msg = '';
      var fullUrl = baseUrl + apiUrl;
      return await http.get(
        Uri.parse(fullUrl),
        headers: headers,
      );
    } on IOException catch (e) {
      debugPrint('Socket Error: $e');
      msg = 'Socket Error: $e';
    } on Error catch (e) {
      debugPrint('General Error: $e');
      msg = 'General Error: $e';
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    } on FormatException catch (e) {
      debugPrint('Timeout Error: $e');
      msg = 'Timeout Error: $e';
    }

    if (msg != '') {
      debugPrint(msg);
      ShowMyDialog.showMsg(context, msg, 'error');
    }
    return null;
  }

  static _setHeaders() => {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
}
