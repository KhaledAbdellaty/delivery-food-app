import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<void> casheUserId(String userId);
  String getCasheUserId();
}

class AuthLocalDataSourceImpl extends UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> casheUserId(String userId) async {
    await sharedPreferences.setString('CASHED_USER_INFO', userId);
  }

  @override
  String getCasheUserId() {
    final userId = sharedPreferences.getString('CASHED_USER_INFO');
    return userId!;
  }
}
