import 'package:http/http.dart' as http;
import 'package:shuffle_uikit/localization/l10n.dart';

class UrlValidator {
  static Future<String?> validateUrl(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return null;
      } else {
        return S.current.StatusXIsNotAvailable(response.statusCode);
      }
    } catch (e) {
      return S.current.ErrorFailedConnectToX(url);
    }
  }
}
