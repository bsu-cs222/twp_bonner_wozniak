import 'package:flutter_test/flutter_test.dart';
import 'package:two_week_project/change_url.dart';


void main(){
  test(('This is a complete url'), (){
    final builder = UrlBuilder();
    String result = builder.build(articleName: 'Trump', numberOfEditors: 1);
    expect(result,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump&rvprop=timestamp|user&rvlimit=1&redirects');
  });
}