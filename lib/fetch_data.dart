
import 'package:http/http.dart' as http;
class DataFetcher {
  Future<String> getDataFromInternet(String revisedUrl) async {
    Uri url = Uri.parse(revisedUrl);
    http.Response internetResponse = await http.get(url);
    String result = internetResponse.body;
    return result;
  }
}
