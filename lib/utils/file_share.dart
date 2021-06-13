import 'package:share/share.dart';

class FileShare {
  void shareFilmUrl(String url) {
    Share.share(url);
  }
}
