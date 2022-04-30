import 'package:dio/dio.dart';
import 'package:last_getx/models/user.dart';

class Net_Dio {
  static final base_url =
      "https://6265b7fedbee37aff9a83f80.mockapi.io/api/users/";

  static Dio dio = Dio();

  static Future<String> GET({dynamic id = ''}) async {
    Response<String> res = await dio.get(base_url + id.toString());
    if (res.statusCode == 200) return res.data!;
    return "";
  }

  static Future<String> Update(User u) async {
    Response<String> res = await dio.put(base_url + u.id, data: u.ToJson());
    if (res.statusCode == 200) return res.data!;
    return "";
  }

  static Future<String> Delete(User user) async {
    Response<String> res = await dio.delete(base_url + user.id);
    if (res.statusCode == 200) return res.data!;
    return "";
  }

  static Future<String> Create(User user) async {
    Response<String> res = await dio.post(base_url, data: user.ToJson());
    if (res.statusCode == 200 || res.statusCode == 201) return res.data!;
    return "";
  }
}
