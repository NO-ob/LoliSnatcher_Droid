import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class SecureStorageHandler {
  static SecureStorageHandler get instance => GetIt.instance<SecureStorageHandler>();

  static SecureStorageHandler register() {
    if (!GetIt.instance.isRegistered<SecureStorageHandler>()) {
      GetIt.instance.registerSingleton(SecureStorageHandler());
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<SecureStorageHandler>();

  //

  final FlutterSecureStorage storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  Future<void> write(SecureStorageKey key, String value) async {
    await storage.write(key: key.name, value: value);
  }

  Future<String?> read(SecureStorageKey key) async {
    return storage.read(key: key.name);
  }

  Future<bool> contains(SecureStorageKey key) async {
    return await read(key) != null;
  }

  Future<void> delete(SecureStorageKey key) async {
    await storage.delete(key: key.name);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}

enum SecureStorageKey {
  viewedUpdateChangelogForBuild,
}
