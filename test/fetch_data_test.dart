import 'package:flutter_test/flutter_test.dart';
import 'package:two_week_project/fetch_data.dart';
import 'package:two_week_project/revision_parser.dart';

void main()async{
  String url = 'https://en.wikipedia.org/w/api.php?action=query&format=json&'
      'prop=revisions&titles=Soup&rvprop=timestamp|user&rvlimit=4&redirects';
  final data = DataFetcher();
  String newUrl = await data.getDataFromInternet(revisedUrl: url);
test(("It works"), (){
  final parser = RevisionParser();
  String user = parser.getTheMostRecentEditor(newUrl);
  expect(user, 'Bermicourt');
});
}