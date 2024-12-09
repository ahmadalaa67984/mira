import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/locale_preference_cm.dart';

class KeyValueStorage {
  static const _localePreferenceBoxKey = 'locale-preference';

  KeyValueStorage() : _hive = Hive {
    try {
      _hive..registerAdapter(LocalePreferenceCMAdapter());
    } catch (error) {
      throw Exception(error);
    }
  }

  final HiveInterface _hive;

  Future<Box<LocalePreferenceCM>> get localePreferenceBox =>
      _openHiveBox<LocalePreferenceCM>(
        _localePreferenceBoxKey,
        isTemporary: false,
      );

  Future<Box<T>> _openHiveBox<T>(
    String boxKey, {
    required bool isTemporary,
  }) async {
    if (_hive.isBoxOpen(boxKey)) {
      return _hive.box(boxKey);
    } else {
      final directory = await (isTemporary
          ? getTemporaryDirectory()
          : getApplicationDocumentsDirectory());
      return _hive.openBox<T>(
        boxKey,
        path: directory.path,
      );
    }
  }
}
