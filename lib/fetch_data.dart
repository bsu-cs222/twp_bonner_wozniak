
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
  Future<String> getDataFromInternet() async{
    final urlFetcher = UrlFetcher();
    var urlAsString = urlFetcher.getInformationFromUser();
    Uri url = Uri.parse(urlAsString);
    http.Response internetResponse = await http.get(url);
     return internetResponse.body;
  }
}
  //String string = response.body;
  //final decoded = jsonDecode(string);
  //final pagesMap = decoded['query']['pages'];
  //final pageId = pagesMap.keys.first;
  //final username = pagesMap[pageId]['revisions'][0]['user'];
void main(){
  final m = DataFetcher();
  print(m.getDataFromInternet());
}

