import 'package:get_it/get_it.dart';

// TODO class for controling native notifications
class NotifyHandler {
  NotifyHandler();

  static NotifyHandler get instance => GetIt.instance<NotifyHandler>();

  static NotifyHandler register() {
    if (!GetIt.instance.isRegistered<NotifyHandler>()) {
      GetIt.instance.registerSingleton(NotifyHandler());
    }
    return instance;
  }

  static void unregister() => GetIt.instance.unregister<NotifyHandler>();
}
