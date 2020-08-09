import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;

/**
 * This launches the permissions dialogue to get storage permissions from the user
 * it is called before every operation which would require writing to storage which is why its in its own function
 * The dialog will not show if the user has already accepted perms
 */
Future getPerms() async{
  if (Platform.isAndroid){
    return await Permission.storage.request().isGranted;
  }
  print(Platform.environment['HOME']);
}