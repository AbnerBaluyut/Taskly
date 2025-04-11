import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Endpoints {
  static String baseUrl = dotenv.env["BASE_URL"] ?? "";
  static String login = dotenv.env["LOGIN"] ?? "";
  static String editProfile = dotenv.env["EDIT_PROFILE"] ?? "";
  static String changePassword = dotenv.env["CHANGE_PASSWORD"] ?? "";
}