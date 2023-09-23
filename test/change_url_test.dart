import 'package:flutter_test/flutter_test.dart';
import 'package:two_week_project/change_url.dart';
import 'package:two_week_project/user_input.dart';

void main(){
  final input = UserInputs();
  final changer = WikiBuilder();
  test(('Page is trump'),(){
    final name= input.article;
    final result = changer.nameChanger(name);
    expect(result,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump');
  });
  test (('Page Limit is 1'),(){
    final limit = input.limit;
    final result= changer.limitChanger(limit);
    expect(result,'&rvprop=timestamp|user&rvlimit=1&redirects');
  });
  test(('This is a complete url'), (){
    final name = input.article;
    final limit = input.limit;
    String firstHalf = changer.nameChanger(name);
    String secondHalf = changer.limitChanger(limit);
    String complete = changer.builder(firstHalf, secondHalf);
    expect(complete,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump&rvprop=timestamp|user&rvlimit=1&redirects');
  });
}