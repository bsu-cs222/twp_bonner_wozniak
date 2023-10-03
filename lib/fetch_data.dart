
import 'package:http/http.dart' as http;
class DataFetcher {
  Future<String> getDataFromWikipedia(String revisedUrl) async {
    Uri url = Uri.parse(revisedUrl);
    http.Response internetResponse = await http.get(url);
    String response = internetResponse.body;
    return response;
  }
}
