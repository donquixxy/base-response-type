import 'dart:convert';

import 'package:flutter_application_1/apimodels.dart';
import 'package:http/http.dart' as http;

class ApiTest {
  Future<ApiResponse> getResponse() async {
    var response = await http.get(Uri.https('reqres.in', '/api/users/2'));

    return _parse(response);
  }

  Future<ApiResponse> getList() async {
    var response = await http.get(Uri.https('reqres.in', '/api/users?page=2'));

    return _parse(response);
  }

  Future<ApiResponse> _parse(http.Response response) async {
    return ApiResponse.fromJson(jsonDecode(response.body));
  }
}

class CallApi {
  ApiTest test = ApiTest();
  Future<SingleResponse<Person>> getSingle() async {
    var response = await test.getResponse();

    var returnData = SingleResponse<Person>.fromJson(
        response.data, (element) => Person.fromJson(element));

    return returnData;
  }

  Future<ListResponse<Person>> getListPerson() async {
    var response = await test.getList();

    var returnData = ListResponse<Person>.fromJson(response.data,
        (element) => element.map((e) => Person.fromJson(e)).toList());

    return returnData;
  }
}
