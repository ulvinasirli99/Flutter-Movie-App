import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tmdb_movie_app/global/message/custom_toast.dart';

class AllPermissionHandler {
 
  AllPermissionHandler._(this.context);
 
  final BuildContext context;
 
  Future<void> storagePermission() async {
 
    var status = await Permission.storage.status;
 
    if (status.isDenied) {
 
      CustomToast().customToast("Stoarge Permissioon is Denied", context);

      await Permission.storage.request();
 
    }
 
   else if (status.isGranted) {
 
      CustomToast().customToast("Stoarge Permissioon is Granted", context);
 
    }
 
   else if (await Permission.storage.isRestricted) {
 
      CustomToast().customToast("Stoarge Permissioon is Restricted", context);
 
 
    }
 
  }

}