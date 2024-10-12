import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userUuid = await secureStorage.getString('ff_userUuid') ?? _userUuid;
    });
    await _safeInitAsync(() async {
      _timeCountToValidateRetrieval =
          await secureStorage.getInt('ff_timeCountToValidateRetrieval') ??
              _timeCountToValidateRetrieval;
    });
    await _safeInitAsync(() async {
      _timeCountToValidateConversation =
          await secureStorage.getInt('ff_timeCountToValidateConversation') ??
              _timeCountToValidateConversation;
    });
    await _safeInitAsync(() async {
      _cardPerRetrieval = await secureStorage.getInt('ff_cardPerRetrieval') ??
          _cardPerRetrieval;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _userUuid = 'aaaa';
  String get userUuid => _userUuid;
  set userUuid(String value) {
    _userUuid = value;
    secureStorage.setString('ff_userUuid', value);
  }

  void deleteUserUuid() {
    secureStorage.delete(key: 'ff_userUuid');
  }

  int _timeCountToValidateRetrieval = 5;
  int get timeCountToValidateRetrieval => _timeCountToValidateRetrieval;
  set timeCountToValidateRetrieval(int value) {
    _timeCountToValidateRetrieval = value;
    secureStorage.setInt('ff_timeCountToValidateRetrieval', value);
  }

  void deleteTimeCountToValidateRetrieval() {
    secureStorage.delete(key: 'ff_timeCountToValidateRetrieval');
  }

  int _timeCountToValidateConversation = 5;
  int get timeCountToValidateConversation => _timeCountToValidateConversation;
  set timeCountToValidateConversation(int value) {
    _timeCountToValidateConversation = value;
    secureStorage.setInt('ff_timeCountToValidateConversation', value);
  }

  void deleteTimeCountToValidateConversation() {
    secureStorage.delete(key: 'ff_timeCountToValidateConversation');
  }

  int _cardPerRetrieval = 10;
  int get cardPerRetrieval => _cardPerRetrieval;
  set cardPerRetrieval(int value) {
    _cardPerRetrieval = value;
    secureStorage.setInt('ff_cardPerRetrieval', value);
  }

  void deleteCardPerRetrieval() {
    secureStorage.delete(key: 'ff_cardPerRetrieval');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
