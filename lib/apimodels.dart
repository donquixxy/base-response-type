
class ApiResponse {
  final String message;
  final int statusCode;
  final Map<String, dynamic> data;

  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: json['data'],
      message: 'Sukses',
      statusCode: 200,
    );
  }

  @override
  String toString() {
    return 'Api Response, $data';
  }
}

class SingleResponse<T> {
  T data;

  SingleResponse({required this.data});

  factory SingleResponse.fromJson(Map<String, dynamic> json,
          Function(Map<String, dynamic> element) createObject) =>
      SingleResponse<T>(
        data: createObject(json),
      );
}

class ListResponse<T> {
  List<T> data;

  ListResponse({required this.data});

  factory ListResponse.fromJson(Map<String, dynamic> json,
      Function(List<dynamic> element) createListObj) {
    var response = <T>[];
    (json['data'] as List).forEach((element) {
      response.add(createListObj(element));
    });

    return ListResponse<T>(
      data: response,
    );
  }
}

class Person {
  final String firstName;
  final String email;

  Person({required this.email, required this.firstName});

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        email: json['email'],
        firstName: json['first_name'],
      );

  @override
  String toString() {
    return 'Person {$firstName , $email}';
  }
}
