import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class RegexConstant {
  static const String emailStaffCodeRegexString =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+|[0-9]";

  static const String passwordRegexString =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  static const emojisRegexString =
      r"(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])";

  static bool isEmailStaffCodeValid(String email) {
    return RegExp(emailStaffCodeRegexString).hasMatch(email);
  }

  static Future<bool> isImageURL(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        return contentType != null && contentType.startsWith('image/');
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static bool isPasswordValid(String password) {
    return RegExp(passwordRegexString).hasMatch(password);
  }

  static bool isMp3(String fileMp3) {
    return path.extension(fileMp3) == ".mp3";
  }
}
