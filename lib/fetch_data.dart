import 'package:http/http.dart' as http;
import 'package:two_week_project/change_url.dart';
import 'package:two_week_project/user_input.dart';

class UrlFetcher{
  final urlFactory = WikiBuilder();
  final userInput = UserInputs();
  String getInformationFromUser(){
    final urlFirstHalf = urlFactory.nameChanger(userInput.article);
    final urlSecondHalf =urlFactory.limitChanger(userInput.limit);
    return urlFactory.urlCombiner(urlFirstHalf, urlSecondHalf);
  }
}
class DataFetcher {
  Future<String> getDataFromInternet() async {
    final urlFetcher = UrlFetcher();
    final urlAsString = urlFetcher.getInformationFromUser();
    Uri url = Uri.parse(urlAsString);
    http.Response internetResponse = await http.get(url);
    String result = internetResponse.body;
    return result;
  }
}
