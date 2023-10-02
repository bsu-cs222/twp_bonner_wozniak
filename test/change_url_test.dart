import 'package:flutter_test/flutter_test.dart';
import 'package:two_week_project/change_url.dart';


void main(){
  test(('This is a complete url'), (){
    final builder = UrlBuilder();
    String url = builder.build(name: 'Trump', limit: 1);
    expect(url,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump&rvprop=timestamp|user&rvlimit=1&redirects');
  });
}