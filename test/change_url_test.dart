import 'package:flutter_test/flutter_test.dart';
import 'package:two_week_project/change_url.dart';
import 'package:two_week_project/user_input.dart';

void main(){
  final input = UserInputs();
  final changer = wikiBuilder();
  test(('Page is trump'),(){
    final name= input.article;
    final result = changer.NameChanger(name);
    expect(result,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump');
  });
  test (('Page Limit is 1'),(){
    final limit = input.limit;
    final result= changer.LimitChanger(limit);
    expect(result,'&rvprop=timestamp|user&rvlimit=1&redirects');
  });
  test(('This is a complete url'), (){
    final name = input.article;
    final limit = input.limit;
    String firstHalf = changer.NameChanger(name);
    String secondHalf = changer.LimitChanger(limit);
    String complete = changer.Builder(firstHalf, secondHalf);
    expect(complete,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump&rvprop=timestamp|user&rvlimit=1&redirects');
  });
}