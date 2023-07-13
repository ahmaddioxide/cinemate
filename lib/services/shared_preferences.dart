import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferenceService {
  Future<bool> ifOpenedBefore();
  Future<bool> setOpenedBeforeTrue();
}

class SharedPreferenceServiceImpl implements SharedPreferenceService {
  @override
  Future<bool> ifOpenedBefore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('openedBefore') ?? false;
  }

  @override
  Future<bool> setOpenedBeforeTrue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('openedBefore', true);
  }
}