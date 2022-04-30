import 'dart:convert';

class User {
  String id;
  String title;
  String body;
  User({
    required this.id,
    required this.title,
    required this.body,
  });

  factory User.fromjson(dynamic map) {
    return User(
      id: map['id'].toString(),
      title: map['title'],
      body: map['body'],
    );
  }

  String ToJson() {
    return jsonEncode(<String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    });
  }
}
