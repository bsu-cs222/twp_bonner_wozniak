import 'package:flutter_test/flutter_test.dart';
import 'package:two_week_project/change_url.dart';
import 'package:two_week_project/user_input.dart';

void main(){
  final input = UserInputs();
  final changer = WikiBuilder();
  final name= input.article;
  final limit = input.limit;
  String firstHalf = changer.nameChanger(name);
  String secondHalf = changer.limitChanger(limit);
  test(('Page is trump'),(){
    expect(firstHalf,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump');
  });
  test (('Page Limit is 1'),(){
    expect(secondHalf,'&rvprop=timestamp|user&rvlimit=1&redirects');
  });
  test(('This is a complete url'), (){
    String complete = changer.builder(firstHalf, secondHalf);
    expect(complete,'https://en.wikipedia.org/w/api.php?'
        'action=query&format=json&prop='
        'revisions&titles='
        'Trump&rvprop=timestamp|user&rvlimit=1&redirects');
  });
}