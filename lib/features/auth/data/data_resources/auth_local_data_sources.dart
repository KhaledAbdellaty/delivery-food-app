import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  Future<void> casheUserId(String userId);
  getCasheUserId();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> casheUserId(String userId) async {
    await sharedPreferences.setString('CASHED_USER_INFO', userId);
  }

  @override
  getCasheUserId() {
    final userId = sharedPreferences.getString('CASHED_USER_INFO');
    if (userId != null) {
      return userId;
    }
    return null;
  }
}
