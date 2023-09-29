import 'package:http/http.dart' as http;
import 'package:two_week_project/change_url.dart';

class UrlBuilder{
  final urlFactory = WikiBuilder();
  String getInformationFromUser({required String article, required String limit}){
    final urlFirstHalf = urlFactory.nameChanger(article);
    final urlSecondHalf =urlFactory.limitChanger(limit);
    return urlFactory.urlCombiner(urlFirstHalf, urlSecondHalf);
  }
}
class DataFetcher {
  Future<String> getDataFromInternet({required String revisedUrl}) async {
    Uri url = Uri.parse(revisedUrl);
    http.Response internetResponse = await http.get(url);
    String result = internetResponse.body;
    return result;
  }
}
