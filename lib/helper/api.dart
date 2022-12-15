// يساعدنا في عمليات api
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  // جلب البيانات
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      //البيانات التي نجتاجها تحتاج الى صلاحيه الوصول
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    // ننسخ الرابط ثم نحوله الى رابط لكي نستطيع التعامل معه
    http.Response response = await http.get(Uri.parse(url), headers: headers);
// ننسخ الرابط ثم نحوله الى رابط لكي نستطيع التعامل معه

    if (response.statusCode == 200) {
      // List تحويل البيانات التي تاتي من الانترنت الى جيسون واضافتها الى قائمه
      return jsonDecode(response.body);
    } else {
      throw Exception(
          // اذا كان مش 200 رح نرمي استثناء لكي نعرض رساله الخطى
          'there is a problem with status code ${response.statusCode}');
    }
  }

//اضافة البيانات//
// key and Value التي تحتوي البيانات التي نريد نرسلها وتكون على شكل ماب body هي التي يكون فيها post

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    //
    Map<String, String> headers = {}; //يشكل اهم نقطه مثل النوع والصلاحيات
    // 'Accept': 'application/json', ترسل على شكل جيسون
    // 'Content-Type': 'application/x-www-form-urlencoded', النوع البياني
    // 'Authorization': 'Bearer', الصلاحيات الوصول الاضافةو التعديل
    //post reqwest شويه بيانات تترسل مع
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
        // headers مشاكل في الارسال البيانات
        //'Content-Type': 'application/x-www-form-urlencoded'putدائما يكون في حاله
        // Content-Type : from-data postدائما يكون في حاله
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          // اذا كان مش 200 رح نرمي استثناء لكي نعرض رساله الخطى
          'there is a problem with status code ${response.statusCode}with body ${jsonDecode(response.body)}');
    }
  }

// التعدسل

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    //
    Map<String, String> headers = {};
    headers.addAll({
      //putدائما يكون في حاله
      'Content-Type': 'application/x-www-form-urlencoded',
      // Content-Type : from-data ///postدائما يكون في حاله
    });
    if (token != null) {
      //البيانات التي نجتاجها تحتاج الى صلاحيه
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    print('url $url  body = $body token = $token');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          // اذا كان مش 200 رح نرمي استثناء لكي نعرض رساله الخطى
          'there is a problem with status code ${response.statusCode}with body ${jsonDecode(response.body)}');
    }
  }
}
